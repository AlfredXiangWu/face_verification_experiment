Lightened CNN for Deep Face Representation
===================
Updates
---
 - Nov 08, 2016
	 - The prototxt and model C based on caffe-rc3 is updated. The accuracy on LFW achieves 98.80% and the TPR@FAR=0 obtains **94.97%**. 
	 - The performance of set 1 on MegaFace achieves **65.532%** for rank-1 accuracy and **75.854%** for TPR@FAR=10^-6. 
 - Nov 26, 2015
	 - The prototxt and model B is updated and the accuracy on LFW achieves 98.13% for a single net without training on LFW. 
 - Aug 13, 2015
	 - Evaluation of LFW for identification protocols is published.  
 - Jun 11, 2015
	 - The prototxt and model A is released. The accuracy on LFW achieves 97.77%. 

Overview
-----------

The Deep Face Representation Experiment is based on Convolution Neural Network to learn a robust feature for face verification task. The popular deep learning framework [<i>caffe</i>][1] is used for training on face datasets such as CASIA-WebFace, VGG-Face and MS-Celeb-1M. And the feature extraction is realized by python code [<i>caffe_ftr.py</i>][3].

Structure
-------------

 - Code
	 - data pre-processing and evaluation code
 - Model
	 - caffemodel. 
		 - The model A and B is trained on CASIA-WebFace by **caffe-rc**.
		 - The model C is trained on MS-Celeb-1M by **caffe-rc3**. 
 - Proto
	 - Lightened CNN implementations by caffe
 - Results
	 - LFW features



Description
-------------
Data Pre-processing

 1. Download face dataset such as  CASIA-WebFace, VGG-Face and MS-Celeb-1M.
 2. All face images are converted to gray-scale images and normalized to 144x144 according to landmarks. 
 3. According to the 5 facial points, we not only rotate two eye points horizontally but also set the distance between the midpoint of eyes and the midpoint of mouth(ec_mc_y), and the y axis of midpoint of eyes(ec_y) .

   Dataset     | size    |  ec_mc_y  | ec_y  
  :----| :-----: | :----:    | :----: 
  Training set | 144x144 |     48    | 48    
  Testing set  | 128x128 |     48    | 40    

Training

 1. The model is trained by open source deep learning framework <i>caffe</i>.
 2. The network configuration is showed in "proto" file and the trained model is showed in "model" file.

Evaluation

 1. The model is evaluated on LFW which is a popular data set for face verification task.
 2. The feature extraction is used by python program [<i>caffe_ftr.py</i>][3]. The extracted features and lfw testing pairs are located in "results" file.
 3. To evaluate the model, the [matlab code][4] or other ROC evaluation code can be used. 
 4. The model is also evaluated on MegaFace. The dataset and evaluation code can be download from http://megaface.cs.washington.edu/


Results

The single convolution net testing is evaluated on unsupervised setting only computing cosine similarity for lfw pairs.   

|   Model | EER | TPR@FPR(FAR)=1%   | TPR@FPR(FAR)=0.1%| TPR@FPR(FAR)=0| Rank-1| DIR@FAR=1%|
| :------- | :----: | :---: | :---: |:---: | :---: |:---: |
| A | 97.77% |  94.80% | 84.37%| 43.17%| 84.79%| 63.09%|
| B | 98.13% |    96.73%    |    87.13%  |    64.33%  |   89.21%   |   69.46%   |
| C | 98.80% |    98.60%    |    96.77%  |    94.97%  |   93.80%   |   84.40%   |


The details are published as a technical report on [arXiv][5]. 
If you use our models, please cite the following paper:

	@article{wu2015lightened,
	  title={A Lightened CNN for Deep Face Representation},
	  author={Wu, Xiang and He, Ran and Sun, Zhenan},
	  journal={arXiv preprint arXiv:1511.02683},
	  year={2015}
	}
	@article{wu2015learning,
	  title={Learning Robust Deep Face Representation},
	  author={Wu, Xiang},
	  journal={arXiv preprint arXiv:1507.04844},
	  year={2015}
	}

**The released models are only allowed for non-commercial use.**

  [1]: https://github.com/AlfredXiangWu/caffe
  [2]: http://www.cbsr.ia.ac.cn/english/CASIA-WebFace-Database.html
  [3]: https://github.com/AlfredXiangWu/python_misc/blob/master/caffe/caffe_ftr.py
  [4]: https://github.com/AlfredXiangWu/lfw_face_verification_experiment/blob/master/code/evaluation.m
  [5]: http://arxiv.org/abs/1511.02683
  

