#!/usr/bin/python3

import os.path
from PIL import Image
from pyzbar.pyzbar import decode

# This is the dictionnary storing the image part and relevant information
cube_imgage_parts = {}


def image_key(side, part):
    return f"E{side}_{part}"


def initImagePart(side, part, rotation, position):
    key = image_key(side, part)
    data = {"rotation": rotation, "position": position}
    cube_imgage_parts[key] = data


def impossibleImageParts(key):
    impossible_corners = []
    for corner_sides in cube_corner_sides:
        if key in corner_sides:
            impossible_corners = corner_sides
    return impossible_corners


def removeImpossibleImageParts(possible_image_parts, impossible_image_parts):
    remaining_image_parts = []
    for part in possible_image_parts:
        if not part in impossible_image_parts:
            remaining_image_parts.append(part)

    return remaining_image_parts


def saveQRcode(alignment, position1, position2, position3):
    padding = 10
    offset = int(padding/2)
    spacing = 0
    img = Image.new('RGB', (width * 2 + padding + spacing,
                            height * 2 + padding + spacing), (255, 255, 255))
    fileName = f"QRCodes/{alignment}_{position1}_{position2}_{position3}.png"
    img.paste(cube_imgage_parts[position1]["img"], (offset, offset))
    img.paste(cube_imgage_parts[position2]
              ["img"].rotate(-90), (width+offset+spacing, offset))
    img.paste(cube_imgage_parts[position3]["img"].rotate(
        90), (offset, height+offset+spacing))
    img.paste(cube_imgage_parts[alignment]["img"],
              (width+offset+spacing, height+offset+spacing))
    result = decode(img)
    if len(result) > 0:
        print(fileName, result[0].data.decode("utf-8"))
        img.save(fileName)


# Definition of all image parts (which side, wich quarter, necessary rotation and alignment)
initImagePart(1, 1, 0, 3)
initImagePart(1, 2, 90, 1)
initImagePart(1, 3, 90, 4)
initImagePart(1, 4, 0, 4)

initImagePart(2, 1, 0, 3)
initImagePart(2, 2, -90, 4)
initImagePart(2, 3, -90, 1)
initImagePart(2, 4, 180, 2)

initImagePart(3, 1, 0, 2)
initImagePart(3, 2, 90, 1)
initImagePart(3, 3, -90, 3)
initImagePart(3, 4, 180, 1)

initImagePart(4, 1, 180, 4)
initImagePart(4, 2, 90, 2)
initImagePart(4, 3, 90, 4)
initImagePart(4, 4, 180, 2)

initImagePart(5, 1, 0, 1)
initImagePart(5, 2, 90, 2)
initImagePart(5, 3, -90, 3)
initImagePart(5, 4, 180, 1)

initImagePart(6, 1, 0, 3)
initImagePart(6, 2, 90, 3)
initImagePart(6, 3, 90, 4)
initImagePart(6, 4, 180, 2)


# List of cube corners and their side: all those images can never appear on the same QR code
cube_corner_sides = [
    [image_key(1, 3), image_key(2, 1), image_key(5, 2)],
    [image_key(1, 4), image_key(2, 2), image_key(6, 1)],
    [image_key(2, 4), image_key(6, 3), image_key(3, 2)],
    [image_key(5, 4), image_key(2, 3), image_key(3, 1)],
    [image_key(1, 2), image_key(4, 4), image_key(6, 2)],
    [image_key(5, 1), image_key(4, 3), image_key(1, 1)],
    [image_key(6, 4), image_key(4, 2), image_key(3, 4)],
    [image_key(3, 3), image_key(4, 1), image_key(5, 3)]
]

# Define extent of basic QR code partial image
width, height, spacing = (92, 92, 4)

parts = Image.new('RGB', (6 * (width * 2 + 20), height * 2 + spacing))
result = Image.new('RGB', (6 * (width * 2 + 20), height * 2))

# List with position or alignment image keys
position1_parts = []
position2_parts = []
position3_parts = []
alignment_parts = []

# Load all images and rotate them appropriately
for e in range(1, 7):
    for i in range(1, 5):
        key = image_key(e, i)
        fileName = f"tiles/{key}.png"
        if os.path.isfile(fileName):
            img = Image.open(fileName)
            degrees = cube_imgage_parts[key]["rotation"]
            if degrees != 0:
                img = img.rotate(degrees)
            cube_imgage_parts[key]["img"] = img

            if cube_imgage_parts[key]["position"] == 1:
                position1_parts.append(key)
            elif cube_imgage_parts[key]["position"] == 2:
                position2_parts.append(key)
            elif cube_imgage_parts[key]["position"] == 3:
                position3_parts.append(key)
            elif cube_imgage_parts[key]["position"] == 4:
                alignment_parts.append(key)

            x = ((e-1)*2 + (i-1) % 2)*width + (e-1) * 20
            y = 0 + int((i-1)/2)*(height + spacing)
            parts.paste(img, (x, y))
            # print(fileName)

# parts.save('parts.png')

print('Position 1 tiles: ', len(position1_parts), position1_parts)
print('Position 2 tiles: ', len(position2_parts), position2_parts)
print('Position 3 tiles: ', len(position3_parts), position3_parts)
print('Alignment tiles:  ', len(alignment_parts), alignment_parts)
for alignment_part in alignment_parts:
    # find "corner sides"
    # print(alignment_part)

    impossible_parts1 = impossibleImageParts(alignment_part)
    #print("  ", len(impossible_parts1), impossible_parts1)
    possible_position_parts1 = removeImpossibleImageParts(
        position1_parts, impossible_parts1)

    #print("  ", len(possible_position_parts1), possible_position_parts1)
    for selected_position_part1 in possible_position_parts1:
        #print("  ", selected_position_part1)

        impossible_parts2 = impossible_parts1 + \
            impossibleImageParts(selected_position_part1)
        #print("    ", len(impossible_parts2), impossible_parts2)
        possible_position_parts2 = removeImpossibleImageParts(
            position2_parts, impossible_parts2)

        #print("    ", len(possible_position_parts2), possible_position_parts2)
        for selected_position_part2 in possible_position_parts2:
            #print("    ", selected_position_part2)

            impossible_parts3 = impossible_parts2 + \
                impossibleImageParts(selected_position_part2)
            #print("    ", len(impossible_parts3), impossible_parts3)
            possible_position_parts3 = removeImpossibleImageParts(
                position3_parts, impossible_parts3)

            # print("    ", len(possible_position_parts3),
            #     possible_position_parts3)
            for selected_position_part3 in possible_position_parts3:

                # print(alignment_part, selected_position_part1,
                #       selected_position_part2, selected_position_part3)
                saveQRcode(alignment_part, selected_position_part1,
                           selected_position_part2, selected_position_part3)
                # break

            # break

        # break

    # break
