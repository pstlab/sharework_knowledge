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


### Environment Variables

$SHAREWORK_KNOWLEDGE


http://wiki.ros.org/rosjava/Build%20Environment%20Variables


### Package Configuration Steps


## Package Usage 


## References 

(1) Umbrico A., Orlandini A., Cesta A. "An Ontology for Human-Robot Collaboration". Procedia CIRP. Volume 93. 2020. Pages 1097-1102,

(2) Cialdea Mayer, M., Orlandini, A., Umbrico, A. "Planning and execution with flexible timelines: a formal account". Acta Informatica. Volume 53. 2016. Pages 649–680.

(3) Umbrico A., Cesta A., Cialdea Mayer M., Orlandini A. "PLATINUm: A New Framework for Planning and Acting". In: Esposito F., Basili R., Ferilli S., Lisi F. (eds) AI*IA 2017 Advances in Artificial Intelligence. AI*IA 2017. Lecture Notes in Computer Science, Volume 10640. 2017.

(4) M. Faroni, Beschi M., Ghidini S., Pedrocchi N., Umbrico A., Orlandini A., Cesta A. "A Layered Control Approach to Human-Aware Task and Motion Planning for Human-Robot Collaboration". 29th IEEE International Conference on Robot and Human Interactive Communication (RO-MAN). 2020. Pages 1204-1210.

(5) Pellegrinelli S., Orlandini A., Pedrocchi N., Umbrico A., Tolio T. "Motion planning and scheduling for human and industrial-robot collaboration". CIRP Annals.
Volume 66, Issue 1. 2017. Pages 1-4.
