# tiertime_material_profile_maker
Python script for generating a custom material profile .FMD file for TierTime 3d Printers.

The current Mac OS X version of UP Studio allows you to _import_ new material profiles, but it does not allow you to _create_ new profiles. This script is an attempt at a workaround for that.

```
usage: tiertime_material_profile_maker.py [-h] [--template-file TEMPLATE_FILE]
                                          --template {ABS,ABS+,PLA,TPU,CUSTOM}
                                          --name NAME --manufacturer
                                          MANUFACTURER
                                          [--temperature TEMPERATURE]
                                          [--bed-temp BED_TEMP]
                                          [--diameter DIAMETER]
                                          [--density DENSITY]
                                          [--shrinkage SHRINKAGE SHRINKAGE SHRINKAGE]
                                          [--nozzle-diameter {0.2,0.4,0.6}]
                                          [--layer-height LAYER_HEIGHT]
                                          [--speed {0,1,2}]
                                          [--withdraw WITHDRAW]
                                          [--peel-ratio PEEL_RATIO]
                                          [--line-width LINE_WIDTH LINE_WIDTH LINE_WIDTH]
                                          [--scan-speed SCAN_SPEED SCAN_SPEED SCAN_SPEED]
                                          [--send-ratio SEND_RATIO SEND_RATIO SEND_RATIO]
                                          [--temp-bias TEMP_BIAS TEMP_BIAS TEMP_BIAS]
                                          output

positional arguments:
  output                The filename for the new custom material .fmd file

optional arguments:
  -h, --help            show this help message and exit
  --template-file TEMPLATE_FILE
                        Optional alternative .FMD file to use as the source
                        template for customization
  --template {ABS,ABS+,PLA,TPU,CUSTOM}
                        Built-in Tiertime material to base this on: ABS, ABS+,
                        PLA or TPU
  --name NAME           Material name, e.g. "PLA+"
  --manufacturer MANUFACTURER
                        Manufacturer name, e.g. "eSun"
  --temperature TEMPERATURE
                        Base extrusion temperature of meterial
  --bed-temp BED_TEMP   Print bed temperature
  --diameter DIAMETER   Material diameter
  --density DENSITY     Material density
  --shrinkage SHRINKAGE SHRINKAGE SHRINKAGE
                        Material shrinkage percentage
  --nozzle-diameter {0.2,0.4,0.6}
                        Single nozzle diameter that these customizations will
                        be applied to
  --layer-height LAYER_HEIGHT
                        Single layer height that these customizations will be
                        applied to
  --speed {0,1,2}       Single print speed these customizations will be
                        applied to: 0=Normal, 1=Fine, 2=Fast
  --withdraw WITHDRAW   Extrusion withdraw in mm/s
  --peel-ratio PEEL_RATIO
                        Peel ratio for raft and supports, from 0 to 100
  --line-width LINE_WIDTH LINE_WIDTH LINE_WIDTH
                        Line width in float [outline, infill, support]
  --scan-speed SCAN_SPEED SCAN_SPEED SCAN_SPEED
                        Scan speed in int [outline, infill, support]
  --send-ratio SEND_RATIO SEND_RATIO SEND_RATIO
                        Send ratio in float [outline, infill, support]
  --temp-bias TEMP_BIAS TEMP_BIAS TEMP_BIAS
                        Temperature bias in int [outline, infill, support]
```