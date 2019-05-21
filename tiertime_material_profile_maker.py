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
PRINTER_DEFAULT = -1
NOZZLE_DIAMETER = "p2"
LAYER_HEIGHT = "p3"
SPEED = "p4"
SPEED_NORMAL = 0
SPEED_FINE = 1
SPEED_FAST = 2
PRINT_TEMP_LOW = "p6"
PRINT_TEMP_HIGH = "p7"
BED_TEMP_3 = "p8"
WITHDRAW = "p9"
PEEL_RATIO = "p10"
LINE_WIDTH = "p11"
SCAN_SPEED = "p12"
SEND_RATIO = "p13"
TEMP_BIAS = "p14"

# Where the FMD file that ships with UP Studio should be
VENDOR_PATH = '/Applications/UP Studio.app/Contents/Resources/DB/vendor.fmd'

parser = argparse.ArgumentParser()

parser.add_argument("--template-file", action="store", dest="template_file", type=str,
                    help="Optional alternative .FMD file to use as the source template for customization")

parser.add_argument("--template", action="store", dest="template", type=str, required=True, choices=["ABS", "ABS+", "PLA", "TPU", "CUSTOM"],
                    help="Built-in Tiertime material to base this on: ABS, ABS+, PLA or TPU")

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

parser.add_argument("--nozzle-diameter", action="store", dest="nozzle_diameter", type=float, choices=[0.2, 0.4, 0.6],
                    help="Single nozzle diameter that these customizations will be applied to")

parser.add_argument("--layer-height", action="store", dest="layer_height", type=float,
                    help="Single layer height that these customizations will be applied to")

parser.add_argument("--speed", action="store", dest="speed", type=int, choices=[SPEED_NORMAL, SPEED_FINE, SPEED_FAST],
                    help="Single print speed these customizations will be applied to: {0}=Normal, {1}=Fine, {2}=Fast".format(
                        SPEED_NORMAL, SPEED_FINE, SPEED_FAST))

parser.add_argument("--withdraw", action="store", dest="withdraw", type=int,
                    help="Extrusion withdraw in mm/s")

parser.add_argument("--peel-ratio", action="store", dest="peel_ratio", type=int,
                    help="Peel ratio for raft and supports, from 0 to 100")

parser.add_argument("--line-width", action="store", dest="line_width", type=float, nargs=3,
                    help="Line width in float [outline, infill, support]")

parser.add_argument("--scan-speed", action="store", dest="scan_speed", type=int, nargs=3,
                    help="Scan speed in int [outline, infill, support]")

parser.add_argument("--send-ratio", action="store", dest="send_ratio", type=float, nargs=3,
                    help="Send ratio in float [outline, infill, support]")

parser.add_argument("--temp-bias", action="store", dest="temp_bias", type=int, nargs=3,
                    help="Temperature bias in int [outline, infill, support]")

parser.add_argument("output", action="store", type=str,
                    help="The filename for the new custom material .fmd file")

args = parser.parse_args()

template_path = args.template_file if args.template_file is not None else VENDOR_PATH

with open(template_path, 'r') as fmdFile:
    materials = []
    version = fmdFile.readline()
    for line in fmdFile:
        raw = binascii.unhexlify(line.strip())
        data = json.JSONDecoder(object_pairs_hook=OrderedDict).decode(raw)
        if data[NAME] == args.template:

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

                # Update either all layer-height/speed combinations (no args given) or only the specific layer-height/speed combination (both args given)
                if args.layer_height is None and args.speed is None or group[LAYER_HEIGHT] == args.layer_height and group[SPEED] == args.speed:
                    print "Updating printer {0}, nozzle {1}, layer_height {2}, speed {3}".format(
                        group[PRINTER], group[NOZZLE_DIAMETER], group[LAYER_HEIGHT], group[SPEED])
                    group[LAYER_HEIGHT] = args.layer_height if args.layer_height is not None else group[LAYER_HEIGHT]
                    group[SPEED] = args.speed if args.speed is not None else group[SPEED]
                    group[PRINT_TEMP_LOW] = args.temperature if args.temperature is not None else group[PRINT_TEMP_LOW]
                    group[PRINT_TEMP_HIGH] = args.temperature + 10 if args.temperature is not None else group[PRINT_TEMP_HIGH]
                    group[BED_TEMP_3] = args.bed_temp if args.bed_temp is not None else group[BED_TEMP_3]
                    group[WITHDRAW] = args.withdraw if args.withdraw is not None else group[WITHDRAW]
                    group[PEEL_RATIO] = args.peel_ratio if args.peel_ratio is not None else group[PEEL_RATIO]
                    group[LINE_WIDTH] = [args.line_width[0], args.line_width[1], args.line_width[2]] if args.line_width is not None else group[LINE_WIDTH]
                    group[SCAN_SPEED] = [args.scan_speed[0], args.scan_speed[1], args.scan_speed[2]] if args.scan_speed is not None else group[SCAN_SPEED]
                    group[SEND_RATIO] = [args.send_ratio[0], args.send_ratio[1], args.send_ratio[2]] if args.send_ratio is not None else group[SEND_RATIO]
                    group[TEMP_BIAS] = [args.temp_bias[0], args.temp_bias[1], args.temp_bias[2]] if args.temp_bias is not None else group[TEMP_BIAS]

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
                if args.layer_height is None and args.speed is None or group[LAYER_HEIGHT] == args.layer_height and group[SPEED] == args.speed:
                    if args.layer_height is not None:
                        print "LAYER HEIGHT:", group[LAYER_HEIGHT]
                    if args.speed is not None:
                        print "SPEED:", group[SPEED]
                    print "PRINT TEMP LOW:", group[PRINT_TEMP_LOW]
                    print "PRINT TEMP HIGH:", group[PRINT_TEMP_HIGH]
                    print "BED TEMPERATURE:", group[BED_TEMP_3]
                    print "WITHDRAW:", group[WITHDRAW]
                    print "PEEL RATIO:", group[PEEL_RATIO]
                    print
                    print "[OUTLINE, INFILL, SUPPORT]"
                    print "LINE WIDTH:", group[LINE_WIDTH]
                    print "SCAN SPEED:", group[SCAN_SPEED]
                    print "SEND RATIO:", group[SEND_RATIO]
                    print "TEMP BIAS:", group[TEMP_BIAS]
                    break

            output = json.dumps(data)
            encoded = binascii.hexlify(output)
            materials.append(encoded)
            break

    # Write modified version to file
    with open(args.output, 'w') as output:
        output.write(version)
        for encoded in materials:
            output.write(encoded)
            output.write("\r\n")

    print "\nWritten to", args.output
    sys.exit(0)
