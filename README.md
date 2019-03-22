# LXAI Intro Image Captioning Lab @ GTC 

![Header Image](./images/gtc-lab-header.jpeg)

In this lab we'll walkthrough an example of image captioning in Pytorch. We'll begin by downloading and training on the coco image dataset, review data augmentation with croping, rotating, flipping and resizing images. We'll then build a vocabulary for the image annotations and encode the sequences as captions. Our model for this task includes a pretrained encoder CNN to compute features on each image and the decoder RNN which handles the captioning. I'll show you the results of training and evalution from this model including automatically captioning images not included in the training set.

Slides: [Image_Captioning_PyTorch.pdf](./Image_Captioning_PyTorch.pdf)

## Run Locally

### Local Installation

Step-by-step guides for setting up a local Anaconda environment can be found here:  
[workshop installation guides](https://github.com/AccelAI/AI-Workshop-Installation-Guides) directory.


If you already have Pytorch installed on your local machine through an Anaconda distribution, simply clone this repository in your prefered directory, cd into the cloned directory, and type `jupyter notebook` to get started (it will appear in a new browser window or tab).

- Clone and `cd` into this repository

`git clone https://github.com/latinxinai/Intro-Image-Captioning-Lab`

`cd Intro-Image-Captioning`

`jupyter notebook`

If you are not able to launch Jupyter Notebook inside your Pytorch virtual environment execute the following once inside this project directory:

`pip install ipykernel
python -m ipykernel install --user --name=my-virtualenv-name`

**Replace "my-virtualenv-name" with the name of your environment.**

### Get Started

If you've never used PyTorch before, begin at the "Intro to PyTorch" jupyter notebook.

If you are familiar with PyTorch, begin by following instructions to download the dataset below, then, move forward to the "Image Caption Tutorial" jupyter notebook.

# Data

## Get the Data
To acquire the data for this lab to run locally, you'll need to first [install the coco api](http://cocodataset.org/#download), then retreive the data from a Google Cloud Servers where it is hosted. We'll be using the 2014 train and val image data sets.

After the coco api has been installed, run the following commands to download the .zip files containing the image data sets.

`mkdir coco`
`wget http://msvocds.blob.core.windows.net/annotations-1-0-3/captions_train-val2014.zip -P ./coco/`
`wget http://images.cocodataset.org/zips/train2014.zip -P ./coco/`
`wget http://images.cocodataset.org/zips/val2014.zip -P ./coco/`



# References
* https://github.com/karpathy/neuraltalk2/blob/master/coco/coco_preprocess.ipynb
* https://github.com/ntrang086/image_captioning
* https://github.com/yunjey/pytorch-tutorial/tree/master/tutorials/03-advanced/image_captioning
* https://github.com/yanneta/pytorch-tutorials/blob/master/image-caption-tutorial.ipynb
