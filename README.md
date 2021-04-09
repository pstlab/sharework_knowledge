# Knowledge Base Module for Sharework

This repository contains a ROSjava (http://wiki.ros.org/rosjava) package enriching ROS with knowledge representation and reasoning services. The module has been specifically designed for Human-Robot Collaboration. The objective of the package is twofold: (i) the package proposes the use of standard semantic technologies (OWL/RDFS) based on an ontological framework for Human-Robot Collaboration (1) to represent and reason about production knowledge; (ii) the package implements knowledge reasoning and extraction mechanisms to facilitate the deployment of timeline-based task planning technologies (2) in HRC production scenarios.

## Overview

The main components are **ProductionKnowledge** and **ProductionKnowledgeAuthoring**. The former encapsulates a **Knowledge Graph** representing information about  HRC processes, collaborative tasks and human and robot capabilities/skills and, support reasoning and mechanisms. The latter support automatic generation of task planning models. It specificallly compiles the knowledge to dynamically generate a valid and updated timeline-based planning model (2) that can be used by tools like e.g., PLATINUm (3) to coordinate Human and Robot behaviors at task planning level (4,5).

### Package Structure



### Knowledge Access Services

The module offers ROS services to access and update productoin knowledge.


## Installation

The package has been developed and tested for ROS Melodic distribution on Ubunut 18.04. It requires a ROSJava workspace for correct execution and generation of the Java artifacts needed for custom messages and installed JDK 8 or higher.


### Configuring ROSJava Workspace

Create an empty workspace using catkin 

```
mkdir -p ~/ws/src
cd ~/ws
catkin_build
```

We recommend installing rosjava from source. Here are the instructions for **minimal installation** for rosjava. Please refer to the official Wiki for further support (http://wiki.ros.org/rosjava/Tutorials/kinetic/Source%20Installation).

```
wstool init -j4 ~/ws/src https://raw.githubusercontent.com/rosjava/rosjava/kinetic/rosjava.rosinstall
source /opt/ros/melodic/setup.bash
cd ~/ws
rosdep update
rosdep install --from-paths src -i -y
catkin_make
```

### Package Configuration Steps

At this point a ROSJava workspace has been successfully set and everything is ready for the installation of the sharework_knowledge package. 

First, it is necessary to install the ROS package defining custom messages and services defined within the knowledge base module of the Sharework. This package is available on GitHub (https://github.com/pstlab/sharework_knowledge_msgs.git) and cna be installed into the ROSJava workspace as follows: 

```
cd ~/ws/src
git clone https://github.com/pstlab/sharework_knowledge_msgs.git
cd ~/ws
catkin_make
source ~/ws/devel/setup.bash
```

It is possible to verify the successful built of the package by checking ROS service description through ```rosserv show```. For example the following commands

```
cd ~/ws
source devel/setup.bash
rossrv show sharework_knowledge_msgs/KnowledgeRDFUpdatePoint
```
should give the following output which describes the request and response defined for the service **KnowledgeRDFUpdatePoint**

```
string updateType
string[] data
---
sharework_knowledge_msgs/KnowledgeRDFTriple[] result
  string subject
  string property
  string object

```

### Environment Variables

$SHAREWORK_KNOWLEDGE


http://wiki.ros.org/rosjava/Build%20Environment%20Variables



## Package Usage 


## References 

(1) Umbrico A., Orlandini A., Cesta A. "An Ontology for Human-Robot Collaboration". Procedia CIRP. Volume 93. 2020. Pages 1097-1102,

(2) Cialdea Mayer, M., Orlandini, A., Umbrico, A. "Planning and execution with flexible timelines: a formal account". Acta Informatica. Volume 53. 2016. Pages 649–680.

(3) Umbrico A., Cesta A., Cialdea Mayer M., Orlandini A. "PLATINUm: A New Framework for Planning and Acting". In: Esposito F., Basili R., Ferilli S., Lisi F. (eds) AI*IA 2017 Advances in Artificial Intelligence. AI*IA 2017. Lecture Notes in Computer Science, Volume 10640. 2017.

(4) M. Faroni, Beschi M., Ghidini S., Pedrocchi N., Umbrico A., Orlandini A., Cesta A. "A Layered Control Approach to Human-Aware Task and Motion Planning for Human-Robot Collaboration". 29th IEEE International Conference on Robot and Human Interactive Communication (RO-MAN). 2020. Pages 1204-1210.

(5) Pellegrinelli S., Orlandini A., Pedrocchi N., Umbrico A., Tolio T. "Motion planning and scheduling for human and industrial-robot collaboration". CIRP Annals.
Volume 66, Issue 1. 2017. Pages 1-4.
