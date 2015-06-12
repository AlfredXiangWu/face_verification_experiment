Deep Face Representation 
===================

Overview
-----------

This Deep Face Representation Experiment is based on Convolution Neural Network to learn a robust feature for face verification task. The popular deep learning framework [<i>caffe</i>][1] is used for training on [CASIA-WebFace dataset][2]  and the feature extraction is realized by python code [<i>caffe_ftr.py</i>][3].

Structure
-------------
<i class="icon-folder-open"></i>model: caffemodel and solverstate.

<i class="icon-folder-open"></i>proto: convolution network configuration. 
 
<i class="icon-folder-open"></i>results: LFW features

Description
-------------
Data Pre-processing
 
1). Download CASIA-WebFace dataset which contains 493456 face images of 10575 identities. 

2). All face images is converted to gray-scale images and normalized to 144x144 according to landmarks.

3). According to the 5 facial points, we rotate two eye points horizontally and set the distance between the midpoint of eyes and the midpoint of mouth 50 pixels.

Training
1). The model is trained by open source deep learning framework <i>caffe</i>.

2). The network configuration is showed in "proto" file and the trained model is showed in "model" file.

Evaluation
1). The model is evaluated on LFW data set which is a popular data set for face verification task.

2). The feature extraction is used by python program [<i>caffe_ftr.py</i>][3] and the extracted features and lfw testing pairs are located in "results" file.

3). To evaluate the model, the [matlab code][4] or other ROC evaluation code can be used. 

Results
:  The single convolution net evaluation on unsupervised setting on lfw 

|   Dataset   | EER | TPR@0.01   | TPR@0.001| TPR@0|
| :------- | ----: | :---: | :---: |:---: |
| lfw | 97.77% |  94.80% | 84.37%| 43.17%|


Publication
------------
The paper is submitted to ACM MM2015. 

  [1]: https://github.com/AlfredXiangWu/caffe
  [2]: http://www.cbsr.ia.ac.cn/english/CASIA-WebFace-Database.html
  [3]: https://github.com/AlfredXiangWu/python_misc/blob/master/caffe/caffe_ftr.py
  [4]: https://github.com/AlfredXiangWu/matlab_misc/tree/master/face_verification/evaluation
  

