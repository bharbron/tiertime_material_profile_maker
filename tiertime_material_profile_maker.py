import argparse
import binascii
import json
import sys
import time

from collections import OrderedDict

# Useful keys in FMD materials
MAT_ID = "b1"
NAME = "b2"
MANUFACTURER = "b3"
MAT_TEMP = "b4"
BED_TEMP_1 = "b5"
BED_TEMP_2 = "b6"
MAT_DIAMETER = "b7"
MAT_DENSITY = "b8"
SHRINKAGE = "b9"
PRINTER = "p1"
ID_TO_PRINTER = {-1: "default", 10112: "up_mini_2", 10104: "10104", 10105: "10105", 10111: "10111", 10114: "10114", 10115: "10115"}  # 10105 = up_300?
PRINTER_TO_ID = dict(reversed(item) for item in ID_TO_PRINTER.items())
NOZZLE_DIAMETER = "p2"
LAYER_THICK = "p3"
QUALITY = "p4"
ID_TO_QUALITY = {0: "normal", 1: "fine", 2: "fast", 3: "superfast"}
QUALITY_TO_ID = dict(reversed(item) for item in ID_TO_QUALITY.items())
BASIC_SEND_RATE = "p5"  # resets on import to UP Studio
PRINT_TEMP_LOW = "p6"
PRINT_TEMP_HIGH = "p7"
BED_TEMP_3 = "p8"
MAT_WITHDRAW_LENGTH = "p9"
PEEL_RATIO = "p10"
LINE_WIDTH = "p11"  # -0.15 to +0.25 of default: 0.47 @ 0.15, 0.5 @ 0.2, 0.53 @ 0.25, 0.55 @ 0.3, 0.6 @ 0.35
SCAN_SPEED = "p12"
SEND_RATIO = "p13"
TEMP_BIAS = "p14"
ASPEED = "p15"          # enforces a min of 1000 on import to UP Studio
P16 = "p16"
JOGGLE_SPEED = "p17"    # resets on import to UP Studio
P18 = "p18"
P19 = "p19"
PART_SUPPORT_HATCH_SCALE = "p20"
P21 = "p21"
P22 = "p22"
RAFT_LAYER_THICK = "p23"
RAFT_PATH_WIDTH = "p24"
P25 = "p25"
P26 = "p26"
P27 = "p27"
P28 = "p28"


def main():
    parser = argparse.ArgumentParser()

    parser.add_argument("--template-file", action="store", dest="template_file", type=str,
                        default="/Applications/UP Studio.app/Contents/Resources/DB/vendor.fmd",
                        help="Optional alternative .FMD file to use as the source template for customization. \
                        Defaults to \"/Applications/UP Studio.app/Contents/Resources/DB/vendor.fmd\" if not provided.")

    parser.add_argument("--unencoded-template", action="store_true", dest="unencoded_template", default=False,
                        help="Template file will be assumed to not be hex encoded and will therefor not be decoded")

    parser.add_argument("--copy-from", action="store", dest="copy_from", type=str, required=True, choices=["ABS", "ABS+", "PLA", "TPU", "CUSTOM"],
                        help="Built-in Tiertime material to base new material on: ABS, ABS+, PLA or TPU")

    parser.add_argument("--name", action="store", dest="name", type=str, required=True,
                        help="Material name, e.g. \"PLA+\"")

    parser.add_argument("--manufacturer", action="store", dest="manufacturer", type=str, required=True,
                        help="Manufacturer name, e.g. \"eSun\"")

    parser.add_argument("--temperature", action="store", dest="temperature", type=int,
                        help="Base extrusion temperature of meterial")

    parser.add_argument("--bed-temp", action="store", dest="bed_temp", type=int,
                        help="Print bed temperature")

    parser.add_argument("--diameter", action="store", dest="diameter", type=float,
                        help="Material diameter")

    parser.add_argument("--density", action="store", dest="density", type=float,
                        help="Material density")

    parser.add_argument("--shrinkage", action="store", dest="shrinkage", type=float, nargs=3,
                        help="Material shrinkage percentage")

    parser.add_argument("--printer", action="store", dest="printer", type=str, choices=sorted(PRINTER_TO_ID.keys()),
                        help="Printer type that these customizations will be applied to")

    parser.add_argument("--nozzle-diameter", action="store", dest="nozzle_diameter", type=float, choices=[0.2, 0.4, 0.6],
                        help="Nozzle diameter that these customizations will be applied to")

    parser.add_argument("--layer-thickness", action="store", dest="layer_thickness", type=float, choices=[0.05, 0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4],
                        help="Layer height that these customizations will be applied to")

    parser.add_argument("--quality", action="store", dest="quality", type=str, choices=sorted(QUALITY_TO_ID.keys()),
                        help="Print speed/quality these customizations will be applied to")

    # parser.add_argument("--basic-send-rate", action="store", dest="basic_send_rate", type=float,
    #                    help="Basic send rate")

    parser.add_argument("--withdraw-length", action="store", dest="withdraw_length", type=int,
                        help="Material withdraw/retraction distance in mm")

    parser.add_argument("--peel-ratio", action="store", dest="peel_ratio", type=int,
                        help="Peel ratio from 0 to 100")

    parser.add_argument("--line-width", action="store", dest="line_width", type=float, nargs=3,
                        help="Line width in float [outline, infill, support]")

    parser.add_argument("--scan-speed", action="store", dest="scan_speed", type=int, nargs=3,
                        help="Scan speed in int [outline, infill, support]")

    parser.add_argument("--send-ratio", action="store", dest="send_ratio", type=float, nargs=3,
                        help="Send ratio in float [outline, infill, support]")

    parser.add_argument("--temp-bias", action="store", dest="temp_bias", type=int, nargs=3,
                        help="Temperature bias in int [outline, infill, support]")

    parser.add_argument("--aspeed", action="store", dest="aspeed", type=int, nargs=3,
                        help="Acceleration in int [outlint, infill, support]")

    parser.add_argument("--p16", action="store", dest="p16", type=float,
                        help="Parameter p16")

    # parser.add_argument("--joggle-speed", action="store", dest="joggle_speed", type=int,
    #                     help="Joggle speed (travel speed???)")

    parser.add_argument("--p18", action="store", dest="p18", type=float,
                        help="Parameter p18")

    parser.add_argument("--p19", action="store", dest="p19", type=int,
                        help="Parameter p19")

    parser.add_argument("--part-support-hatch-scale", action="store", dest="part_support_hatch_scale", type=float,
                        help="Part support hatch scale (?)")

    parser.add_argument("--p21", action="store", dest="p21", type=float,
                        help="Parameter p21")

    parser.add_argument("--p22", action="store", dest="p22", type=float,
                        help="Parameter p22")

    parser.add_argument("--raft-layer-thickness", action="store", dest="raft_layer_thicknessness", type=float,
                        help="Raft layer thickness")

    parser.add_argument("--raft-path-width", action="store", dest="raft_path_width", type=float,
                        help="Raft path width")

    parser.add_argument("--p25", action="store", dest="p25", type=float,
                        help="Parameter p25")

    parser.add_argument("--p26", action="store", dest="p26", type=int,
                        help="Parameter p26")

    parser.add_argument("--p27", action="store", dest="p27", type=int,
                        help="Parameter p27")

    parser.add_argument("--p28", action="store", dest="p28", type=int,
                        help="Parameter p28")

    parser.add_argument("--non-encoded-output", action="store_true", dest="non_encoded_output", default=False,
                        help="Do not hex encode the output file. Useful if you want to make manual changes before encoding.")

    parser.add_argument("output", action="store", type=str,
                        help="The filename for the new custom material .fmd file")

    args = parser.parse_args()

    with open(args.template_file, 'r') as fmdFile:
        materials = []
        version = fmdFile.readline()
        for line in fmdFile:
            raw = line.strip() if args.unencoded_template else binascii.unhexlify(line.strip())
            data = json.JSONDecoder(object_pairs_hook=OrderedDict).decode(raw)
            if data[NAME] == args.copy_from:

                # UP Studio won't import materials that match an existing ID
                data[MAT_ID] = time.time()

                # Required material args
                data[NAME] = args.name
                data[MANUFACTURER] = args.manufacturer

                # Optional material args
                data[MAT_TEMP] = args.temperature if args.temperature is not None else data[MAT_TEMP]
                data[BED_TEMP_1] = args.bed_temp if args.bed_temp is not None else data[BED_TEMP_1]
                data[BED_TEMP_2] = args.bed_temp if args.bed_temp is not None else data[BED_TEMP_2]
                data[MAT_DIAMETER] = args.diameter if args.diameter is not None else data[MAT_DIAMETER]
                data[MAT_DENSITY] = args.density if args.density is not None else data[MAT_DENSITY]
                data[SHRINKAGE] = args.shrinkage if args.shrinkage is not None else data[SHRINKAGE]

                groups = []
                print
                for group in data["group"]:
                    if ((args.printer is None or args.printer == ID_TO_PRINTER.get(group[PRINTER], group[PRINTER])) and
                        (args.nozzle_diameter is None or args.nozzle_diameter == group[NOZZLE_DIAMETER]) and
                        (args.layer_thickness is None or args.layer_thickness == group[LAYER_THICK]) and
                            (args.quality is None or args.quality == ID_TO_QUALITY.get(group[QUALITY], group[QUALITY]))):
                        print "Updating printer {0}, nozzle {1}, layer {2}, speed {3}".format(
                            ID_TO_PRINTER.get(group[PRINTER], group[PRINTER]
                                              ), group[NOZZLE_DIAMETER], group[LAYER_THICK], ID_TO_QUALITY.get(group[QUALITY], group[QUALITY]))
                        # group[BASIC_SEND_RATE] = args.basic_send_rate if args.basic_send_rate is not None else group[BASIC_SEND_RATE]
                        group[PRINT_TEMP_LOW] = args.temperature if args.temperature is not None else group[PRINT_TEMP_LOW]
                        group[PRINT_TEMP_HIGH] = args.temperature + 10 if args.temperature is not None else group[PRINT_TEMP_HIGH]
                        group[BED_TEMP_3] = args.bed_temp if args.bed_temp is not None else group[BED_TEMP_3]
                        group[MAT_WITHDRAW_LENGTH] = args.withdraw_length if args.withdraw_length is not None else group[MAT_WITHDRAW_LENGTH]
                        group[PEEL_RATIO] = args.peel_ratio if args.peel_ratio is not None else group[PEEL_RATIO]
                        group[LINE_WIDTH] = [args.line_width[0], args.line_width[1], args.line_width[2]] if args.line_width is not None else group[LINE_WIDTH]
                        group[SCAN_SPEED] = [args.scan_speed[0], args.scan_speed[1], args.scan_speed[2]] if args.scan_speed is not None else group[SCAN_SPEED]
                        group[SEND_RATIO] = [args.send_ratio[0], args.send_ratio[1], args.send_ratio[2]] if args.send_ratio is not None else group[SEND_RATIO]
                        group[TEMP_BIAS] = [args.temp_bias[0], args.temp_bias[1], args.temp_bias[2]] if args.temp_bias is not None else group[TEMP_BIAS]
                        group[ASPEED] = [args.aspeed[0], args.aspeed[1], args.aspeed[2]] if args.aspeed is not None else group[ASPEED]
                        group[P16] = args.p16 if args.p16 is not None else group[P16]
                        # group[JOGGLE_SPEED] = args.joggle_speed if args.joggle_speed is not None else group[JOGGLE_SPEED]
                        group[P18] = args.p18 if args.p18 is not None else group[P18]
                        group[P19] = args.p19 if args.p19 is not None else group[P19]
                        if args.part_support_hatch_scale is not None:
                            group[PART_SUPPORT_HATCH_SCALE] = args.part_support_hatch_scale
                        else:
                            group[PART_SUPPORT_HATCH_SCALE]
                        group[P21] = args.p21 if args.p21 is not None else group[P21]
                        group[P22] = args.p22 if args.p22 is not None else group[P22]
                        group[RAFT_LAYER_THICK] = args.raft_layer_thicknessness if args.raft_layer_thicknessness is not None else group[RAFT_LAYER_THICK]
                        group[RAFT_PATH_WIDTH] = args.raft_path_width if args.raft_path_width is not None else group[RAFT_PATH_WIDTH]
                        group[P25] = args.p25 if args.p25 is not None else group[P25]
                        group[P26] = args.p26 if args.p26 is not None else group[P26]
                        group[P27] = args.p27 if args.p27 is not None else group[P27]
                        group[P28] = args.p28 if args.p28 is not None else group[P28]

                    groups.append(group)

                data["group"] = groups

                print
                print "NAME:", data[NAME]
                print "MANUFACTURER:", data[MANUFACTURER]
                print "PRINT TEMPERATURE:", data[MAT_TEMP]
                print "BED TEMPERATURE:", data[BED_TEMP_1]
                print "MATERIAL DIAMETER:", data[MAT_DIAMETER]
                print "MATERIAL DENSITY:", data[MAT_DENSITY]
                print "SHRINKAGE %:", data[SHRINKAGE]
                print
                for group in data["group"]:
                    if ((args.printer is None or args.printer == ID_TO_PRINTER.get(group[PRINTER], group[PRINTER])) and
                        (args.nozzle_diameter is None or args.nozzle_diameter == group[NOZZLE_DIAMETER]) and
                        (args.layer_thickness is None or args.layer_thickness == group[LAYER_THICK]) and
                            (args.quality is None or args.quality == ID_TO_QUALITY.get(group[QUALITY], group[QUALITY]))):
                        print "PRINTER:", ID_TO_PRINTER[group[PRINTER]]
                        print "NOZZLE DIAMETER:", group[NOZZLE_DIAMETER]
                        print "LAYER THICKNESS:", group[LAYER_THICK]
                        print "QUALITY:", ID_TO_QUALITY[group[QUALITY]]
                        print "BASIC SEND RATE:", group[BASIC_SEND_RATE]
                        print "PRINT TEMP LOW:", group[PRINT_TEMP_LOW]
                        print "PRINT TEMP HIGH:", group[PRINT_TEMP_HIGH]
                        print "BED TEMPERATURE:", group[BED_TEMP_3]
                        print "MATERIAL WITHDRAW LENGTH:", group[MAT_WITHDRAW_LENGTH]
                        print "PEEL RATIO:", group[PEEL_RATIO]
                        print
                        print "[OUTLINE, INFILL, SUPPORT]"
                        print "LINE WIDTH:", group[LINE_WIDTH]
                        print "SCAN SPEED:", group[SCAN_SPEED]
                        print "SEND RATIO:", group[SEND_RATIO]
                        print "TEMP BIAS:", group[TEMP_BIAS]
                        print "ASPEED:", group[ASPEED]
                        print
                        print "P16:", group[P16]
                        print "JOGGLE SPEED:", group[JOGGLE_SPEED]
                        print "P18:", group[P18]
                        print "P19:", group[P19]
                        print "PART SUPPORT HATCH SCALE:", group[PART_SUPPORT_HATCH_SCALE]
                        print "P21:", group[P21]
                        print "P22:", group[P22]
                        print "RAFT LAYER THICKNESS:", group[RAFT_LAYER_THICK]
                        print "RAFT PATH WIDTH:", group[RAFT_PATH_WIDTH]
                        print "P25:", group[P25]
                        print "P26:", group[P26]
                        print "P27:", group[P27]
                        print "P28:", group[P28]
                        break

                output = json.dumps(data)
                material = output if args.non_encoded_output else binascii.hexlify(output)
                materials.append(material)
                break

        # Write modified version to file
        with open(args.output, 'w') as output:
            output.write(version)
            for material in materials:
                output.write(material)
                output.write("\r\n")

        print "\nWritten to", args.output
        sys.exit(0)


if __name__ == "__main__":
    main()
