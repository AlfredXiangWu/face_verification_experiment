#!/usr/bin/env sh
TOOLS=/home/wuxiang/project/caffe/build/tools
mkdir log

GLOG_logtostderr=0 GLOG_alsologtostderr=1 $TOOLS/caffe train --solver=./DeepFace_set003_solver.prototxt --gpu=0 
GLOG_logtostderr=0 GLOG_alsologtostderr=1 $TOOLS/caffe train --solver=./DeepFace_set003_solver_2.prototxt --gpu=0 --snapshot=./DeepFace_set003_net_iter_2000000.solverstate
