# Knowledge Base Module for Sharework

This repository contains a ROSjava (http://wiki.ros.org/rosjava) package enriching ROS with knowledge representation and reasoning services. The module has been specifically designed for Human-Robot Collaboration. The objective of the package is twofold: (i) the package proposes the use of standard semantic technologies (OWL/RDFS) based on an ontological framework for Human-Robot Collaboration [1] to represent and reason about production knowledge; (ii) the package implements knowledge reasoning and extraction mechanisms to facilitate the deployment of timeline-based task planning technologies [2] in HRC production scenarios.

## Overview

The main components are **ProductionKnowledge** and **ProductionKnowledgeAuthoring**. The former encapsulates a **Knowledge Graph** representing information about  HRC processes, collaborative tasks and human and robot capabilities/skills and, support reasoning and mechanisms. The latter support automatic generation of task planning models. It specificallly compiles the knowledge to dynamically generate a valid and updated timeline-based planning model [2] that can be used by tools like e.g., PLATINUm [3] to coordinate Human and Robot behaviors at task planning level [5,6].

### Package Structure



### Knowledge Access Services

The module offers ROS services to access and update productoin knowledge.


## Installation

The package has been developed and tested for ROS Melodic distribution on Ubunut 18.04. It requires a ROSJava workspace for correct execution and generation of the Java artifacts needed for custom messages and installed JDK 8 or higher.


### Configuring ROSJava Workspace



### Environment Variables

http://wiki.ros.org/rosjava/Build%20Environment%20Variables


### Package Configuration Steps


## Package Usage 


## References

[1] CIRP-CMS 2020

[2] Acta Informatica

[3] Platinum 

[5] RO-MAN 2020

[6] CIRP Annals 2017

