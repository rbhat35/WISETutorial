import os
from glob import glob
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

PATH_1 = './phase1_plots/'
PATH_2 = './run1_plots/'
output_destination = './side_by_side_images/'



image_filenames_1 = [y.replace(PATH_1, '') for x in os.walk(PATH_1) for y in glob(os.path.join(x[0], '*.png'))]
image_filenames_2 = [y.replace(PATH_2, '') for x in os.walk(PATH_2) for y in glob(os.path.join(x[0], '*.png'))]

common_images = list(set(image_filenames_1) & set(image_filenames_2))

for image_name in common_images:

    img_A = mpimg.imread(PATH_1 + image_name)
    img_B = mpimg.imread(PATH_2 + image_name)

    fig, ax = plt.subplots(1,2)
    ax[0].imshow(img_A)
    ax[1].imshow(img_B)
    plt.savefig(output_destination + image_name.replace('/', '-'), dpi=300)
