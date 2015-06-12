Deep Face Representation 
===================

Overview
-----------

This Deep Face Representation Experiment is based on Convolution Neural Network to learn a robust feature for face verification task. The popular deep learning framework [<i>caffe</i>][1] is used for training on [CASIA-WebFace dataset][2]  and the feature extraction is realized by python code [<i>caffe_ftr.py</i>][3].

Structure
-------------
<i class="icon-folder-open"></i>code:  data pre-processing and evaluation code.<br>
<i class="icon-folder-open"></i>model: caffemodel and solverstate.<br>
<i class="icon-folder-open"></i>proto: convolution network configuration. <br>
<i class="icon-folder-open"></i>results: LFW features.<br>


Description
-------------
Data Pre-processing

>1). Download CASIA-WebFace dataset which contains 493456 face images of 10575 identities. <br>
>2). All face images are converted to gray-scale images and normalized to 144x144 according to landmarks.<br>
>3). According to the 5 facial points, we not only rotate two eye points horizontally but also set the distance between the midpoint of eyes and the midpoint of mouth(ec_mc_y), and the y axis of midpoint of eyes(ec_y) .<br>

 |   Dataset     | size    |  ec_mc_y  | ec_y  ||
 | :-------------| :-----: | :----:    | :---: ||
 | CASIA-WebFace | 144x144 |     48    | 48    ||
 | lfw           | 128x128 |     48    | 40    ||

Training
>1). The model is trained by open source deep learning framework <i>caffe</i>.<br>
>2). The network configuration is showed in "proto" file and the trained model is showed in "model" file.<br>

Evaluation
>1). The model is evaluated on LFW data set which is a popular data set for face verification task.<br>
>2). The feature extraction is used by python program [<i>caffe_ftr.py</i>][3] and the extracted features and lfw testing pairs are located in "results" file.<br>
>3). To evaluate the model, the [matlab code][4] or other ROC evaluation code can be used. <br>

Results

  The single convolution net evaluation on unsupervised setting on lfw 

|   Dataset   | EER | TPR@0.01   | TPR@0.001| TPR@0|
| :------- | :----: | :---: | :---: |:---: |
| lfw | 97.77% |  94.80% | 84.37%| 43.17%|


Publication
------------
The paper is submitted to ACM MM2015. 

  [1]: https://github.com/AlfredXiangWu/caffe
  [2]: http://www.cbsr.ia.ac.cn/english/CASIA-WebFace-Database.html
  [3]: https://github.com/AlfredXiangWu/python_misc/blob/master/caffe/caffe_ftr.py
  [4]: https://github.com/AlfredXiangWu/lfw_face_verification_experiment/blob/master/code/evaluation.m
  

