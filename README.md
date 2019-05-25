# tiertime_material_profile_maker
Python script for generating a custom material profile .FMD file for TierTime 3d Printers.

The current Mac OS X version of UP Studio allows you to _import_ new material profiles, but it does not allow you to _create_ new profiles. This script is an attempt at a workaround for that and allow OS X users to create custom materials as well.

### Disclaimer

I make no claim or guarantee that any of this will work at all. I've included very little input validation, I can't guarantee that any of the parameter mappings are correct. You can probably screw up UP Studio or your printer with some bad values. (It does seem that UP Studio does _some_ input validation on material profile import.) **Proceed at your own risk**.

## Usage

```
usage: tiertime_material_profile_maker.py [-h] [--template-file TEMPLATE_FILE]
                                          [--unencoded-template] --copy-from
                                          {ABS,ABS+,PLA,TPU,CUSTOM} --name
                                          NAME --manufacturer MANUFACTURER
                                          [--temperature TEMPERATURE]
                                          [--bed-temp BED_TEMP]
                                          [--diameter DIAMETER]
                                          [--density DENSITY]
                                          [--shrinkage SHRINKAGE SHRINKAGE SHRINKAGE]
                                          [--printer {10104,10105,10111,10114,10115,default,up_mini_2}]
                                          [--nozzle-diameter {0.2,0.4,0.6}]
                                          [--layer-thickness {0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4}]
                                          [--quality {fast,fine,normal,superfast}]
                                          [--withdraw-length WITHDRAW_LENGTH]
                                          [--peel-ratio PEEL_RATIO]
                                          [--line-width LINE_WIDTH LINE_WIDTH LINE_WIDTH]
                                          [--scan-speed SCAN_SPEED SCAN_SPEED SCAN_SPEED]
                                          [--send-ratio SEND_RATIO SEND_RATIO SEND_RATIO]
                                          [--temp-bias TEMP_BIAS TEMP_BIAS TEMP_BIAS]
                                          [--aspeed ASPEED ASPEED ASPEED]
                                          [--p16 P16] [--p18 P18] [--p19 P19]
                                          [--part-support-hatch-scale PART_SUPPORT_HATCH_SCALE]
                                          [--p21 P21] [--p22 P22]
                                          [--raft-layer-thickness RAFT_LAYER_THICKNESSNESS]
                                          [--raft-path-width RAFT_PATH_WIDTH]
                                          [--p25 P25] [--p26 P26] [--p27 P27]
                                          [--p28 P28] [--non-encoded-output]
                                          output

positional arguments:
  output                The filename for the new custom material .fmd file

optional arguments:
  -h, --help            show this help message and exit
  --template-file TEMPLATE_FILE
                        Optional alternative .FMD file to use as the source
                        template for customization. Defaults to
                        "/Applications/UP
                        Studio.app/Contents/Resources/DB/vendor.fmd" if not
                        provided.
  --unencoded-template  Template file will be assumed to not be hex encoded
                        and will therefor not be decoded
  --copy-from {ABS,ABS+,PLA,TPU,CUSTOM}
                        Built-in Tiertime material to base new material on:
                        ABS, ABS+, PLA or TPU
  --name NAME           Material name, e.g. "PLA+"
  --manufacturer MANUFACTURER
                        Manufacturer name, e.g. "eSun"
  --temperature TEMPERATURE
                        Base extrusion temperature of meterial
  --bed-temp BED_TEMP   Print bed temperature
  --diameter DIAMETER   Material diameter. In my experience, I recommend not
                        changing this. By default, Tiertime sets this at 1.7
                        mm, even for 1.75 mm filaments. "Correcting" this to
                        1.75 seems to have a negative effect on flow rate.
  --density DENSITY     Material density
  --shrinkage SHRINKAGE SHRINKAGE SHRINKAGE
                        Material shrinkage percentage
  --printer {10104,10105,10111,10114,10115,default,up_mini_2}
                        Printer type that these customizations will be applied
                        to
  --nozzle-diameter {0.2,0.4,0.6}
                        Nozzle diameter that these customizations will be
                        applied to
  --layer-thickness {0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4}
                        Layer height that these customizations will be applied
                        to
  --quality {fast,fine,normal,superfast}
                        Print speed/quality these customizations will be
                        applied to
  --withdraw-length WITHDRAW_LENGTH
                        Material withdraw/retraction distance
  --peel-ratio PEEL_RATIO
                        Peel ratio from 0 to 100
  --line-width LINE_WIDTH LINE_WIDTH LINE_WIDTH
                        Line width in float [outline, infill, support]
  --scan-speed SCAN_SPEED SCAN_SPEED SCAN_SPEED
                        Scan speed in int [outline, infill, support]
  --send-ratio SEND_RATIO SEND_RATIO SEND_RATIO
                        Send ratio in float [outline, infill, support]
  --temp-bias TEMP_BIAS TEMP_BIAS TEMP_BIAS
                        Temperature bias in int [outline, infill, support]
  --aspeed ASPEED ASPEED ASPEED
                        Acceleration (?) in int [outlint, infill, support]
  --p16 P16             Parameter p16 EXPERIMENTAL
  --p18 P18             Parameter p18 EXPERIMENTAL
  --p19 P19             Parameter p19 EXPERIMENTAL
  --part-support-hatch-scale PART_SUPPORT_HATCH_SCALE
                        ?? Part support hatch scale ?? EXPERIMENTAL
  --p21 P21             Parameter p21 EXPERIMENTAL
  --p22 P22             Parameter p22 EXPERIMENTAL
  --raft-layer-thickness RAFT_LAYER_THICKNESSNESS
                        ?? Raft layer thickness ?? EXPERIMENTAL
  --raft-path-width RAFT_PATH_WIDTH
                        ?? Raft path width ?? EXPERIMENTAL
  --p25 P25             Parameter p25 EXPERIMENTAL
  --p26 P26             Parameter p26 EXPERIMENTAL
  --p27 P27             Parameter p27 EXPERIMENTAL
  --p28 P28             Parameter p28 EXPERIMENTAL
  --non-encoded-output  Do not hex encode the output file. Useful if you want
                        to make manual changes before encoding.
```

## Example

Example of creating a custom material profile, with configurations for several different printers, layer thicknesses, and speeds. Note how we name the material `CUSTOM` until the final step so that we can do `--copy-from CUSTOM` (`--copy-from` being limited to ABS,ABS+,PLA,TPU and CUSTOM). Also note the use of `--non-encoded-output` and `--unencoded-template` to allow manual edits to be made to the .fmd file:

```
python tiertime_material_profile_maker.py --copy-from PLA --name CUSTOM --manufacturer CUSTOM --temperature 205 --bed-temp 0 --diameter 1.75 --density 1.24 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.1 --line-width 0.4 0.7 0.47 --scan-speed 21 42 42 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.42 0.72 0.55 --scan-speed 21 42 42 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer default --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.75 0.55 --scan-speed 21 42 42 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --line-width 0.42 0.72 0.55 --scan-speed 21 42 42 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.2 --line-width 0.4 0.75 0.55 --scan-speed 21 42 42 --aspeed 1000 1000 1000 custom.fmd
python tiertime_material_profile_maker.py --template-file custom.fmd --copy-from CUSTOM --name CUSTOM --manufacturer CUSTOM --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --quality normal --non-encoded-output UNENCODED_custom.fmd

# Open UNENCODED_custom.fmd in a text editor, validate, make some manual edits, etc.

python tiertime_material_profile_maker.py --template-file UNENCODED_custom.fmd --unencoded-template --copy-from CUSTOM --name 205PLA+ --manufacturer eSun --printer up_mini_2 --nozzle-diameter 0.4 --layer-thickness 0.15 --speed normal esun_plaplus_205.fmd
```