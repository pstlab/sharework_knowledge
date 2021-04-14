# Knowledge Base Module for Sharework

This repository contains a **ROSjava package** enriching **ROS** with **knowledge representation and reasoning services**. The module has been specifically designed for **Human-Robot Collaboration**. The objective of the package is twofold: (i) the package proposes the use of standard semantic technologies (OWL/RDFS) based on an ontological framework for Human-Robot Collaboration [1] to represent and reason about production knowledge; (ii) the package implements knowledge reasoning and extraction mechanisms to facilitate the deployment of timeline-based task planning technologies [2] in HRC production scenarios.

## Overview

The main components are **ProductionKnowledge** and **ProductionKnowledgeAuthoring**. The former encapsulates a **Knowledge Graph** representing information about  HRC processes, collaborative tasks and human and robot capabilities/skills and, support reasoning and mechanisms. The latter support automatic generation of task planning models. It specificallly compiles the knowledge to dynamically generate a valid and updated timeline-based planning model [2] that can be used by tools like e.g., PLATINUm [3] to coordinate Human and Robot behaviors at task planning level [4,5].

### Package Structure

TODO


### Knowledge Access Services

The module offers ROS services to access and update productoin knowledge.

TODO


## Installation

The package has been developed and tested for ROS Melodic distribution on Ubunut 18.04. It requires a ROSJava workspace for correct execution and generation of the Java artifacts needed for custom messages and installed Java software.

_We recommend the use of Java 8 since other higher or lower versions of Java may have some dependency issues with rosjava._

In addition, the package requires a locally running instance of mongodb server. The current package has been developed and tested using _MongDB Cumminuty Server v.4.4.5_ that can be downloade from [the official web page](https://www.mongodb.com/try/download/community). 

### ROSJava Workspace Configuration

Create an empty workspace.

```
mkdir -p ~/ws/src
cd ~/ws
catkin_build
```

Here are the instructions for downloading and building **ROSJava from source** (recommended). Please refer to the official [ROSJava Wiki](http://wiki.ros.org/rosjava) for further details about installation and availabe distributions.

```
wstool init -j4 ~/ws/src https://raw.githubusercontent.com/rosjava/rosjava/kinetic/rosjava.rosinstall
source /opt/ros/melodic/setup.bash
cd ~/ws
rosdep update
rosdep install --from-paths src -i -y
catkin_make
```

### Package Preparation 

Once that a ROSJava workspace has been successfully configured everything is ready for the installation of the **sharework_knowledge package**. 

First, it is necessary to install the ROSjava package **sharework_knowledge_msgs** defining custom messages and services defined within the knowledge base module of the Sharework. This package is available on GitHub (https://github.com/pstlab/sharework_knowledge_msgs.git) and can be installed into the ROSJava workspace as follows: 

```
cd ~/ws/src
git clone https://github.com/pstlab/sharework_knowledge_msgs.git
cd ~/ws
catkin_make
source ~/ws/devel/setup.bash
```

It is possible to verify the successful built of the package by checking ROS service description through ```rossrv show```. For example the following commands

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

### Gradle Configuration

Before buliding the ROS package configure **gradle** so that all the dependencies are correctly downloaded. This module indeed relies on some packages (e.g., [PLATINUm](https://github.com/pstlab/PLATINUm)) that are not deployed on maven central but on GitHub. 

To allow gradle to download packages from GitHub repositories create a text file ```gradle.properties``` under the folder ```sharework_knowledge/production_knowledge```. This file should specifiy a **GitHub username**, a **GitHub access token** (_see how to create personal access token on [the official GitHub page](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token) if necessary_) and the **absolute path to workspace** as follows: 

```
gpr.user=<github-user>
gpr.token=<github-personal-access-token>
gpr.ws=<absolute-path-to-the-workspace>
```

As an alternative to the file ```gradle.properties``` the same configuration parameters can be specified using environment variables. For example add to  ```.bashrc``` the definition of the following variables:

```
export GITHUB_USER=<github-user>
export GITHUB_TOKEN=<github-personal-access-token>
export SHAREWORK_WS=<path-to-the-workspace>           # e.g., ~/ws
```

### Bulding the Package

At this point install the **sharework_knowledge package** into the ROSJava workspace by cloning and installing the current repository.

```
cd ~/ws/src
git clone https://github.com/pstlab/sharework_knowledge.git
cd ..
source devel/setup.bash
catkin_make
source devel/setup.bash
```

To finalize the installation just define the environment variable **SHAREWORK_KNOWLEDGE** in order to point to the folder containing the installed package. 

```
export SHAREWORK_KNOWLEDGE=~/ws/src/sharework_knowledge
```

The above line of code can be added to the ```.bashrc``` file to automatically export the environment variable when the terminal is open. 

## Package Usage 

If the the installation and configuration of the **sharework_knowledge** package has been successfully done then it should be possible to run the ROS node starting the developed knowledge services.

First open a terminal and start core ROS nodes using ```roscore```. 

Then, open a different terminal and launch the service as follows:

```
cd ~/ws
source devel/setup.bash
rosrun sharework_knowledge production_knowledge it.cnr.istc.pst.sharework.service.KnowledgeService
```

At this point the service is running and can be called to interact with the knowledg base. As an example considered the following commands to be executed on a third terminal. The commands load one of the ontological models availabine under the folder ```etc/ontologies``` of hte package structure and query the model using respectively the **/sharework/knowledge/update** and **/sharework/knwoledge/api** services.

```
cd ~/ws
source devel/setup.bash
rosservice call /sharework/knowledge/update "load" ["<absolute_path>/ws/src/sharework_ontology/soho_cembre_v0.1.owl"]
rosservice call /sharework/knowledge/api "get_workers" []
```

The frist call load the ontological model defined for one of the case studies of the project in order to fill the knowledge base with the information characterizing the considered collaborative process. _Please note that the file path specified into the "load request" should be absolute._ 

_Note also that when the model is loaded the authoring service is triggered to automatically generate and validate an updated timeline-based planning model for the considered HRC scenario. The authoring process runs in background (i.e., it does not slow down queries/updates on the knowledge) and the output is the file ```prod_knowledge.ddl``` under the folder ```gen``` of the package structure._

The second call retrieves information about defined workers i.e., individuals of the ontological class ```SOHO:WorkOperator``` (in shape of RDF resources).



## References 

[1] Umbrico A., Orlandini A., Cesta A. "An Ontology for Human-Robot Collaboration". Procedia CIRP. Volume 93. 2020. Pages 1097-1102,

[2] Cialdea Mayer, M., Orlandini, A., Umbrico, A. "Planning and execution with flexible timelines: a formal account". Acta Informatica. Volume 53. 2016. Pages 649–680.

[3] Umbrico A., Cesta A., Cialdea Mayer M., Orlandini A. "PLATINUm: A New Framework for Planning and Acting". In: Esposito F., Basili R., Ferilli S., Lisi F. (eds) AI*IA 2017 Advances in Artificial Intelligence. AI*IA 2017. Lecture Notes in Computer Science, Volume 10640. 2017.

[4] M. Faroni, Beschi M., Ghidini S., Pedrocchi N., Umbrico A., Orlandini A., Cesta A. "A Layered Control Approach to Human-Aware Task and Motion Planning for Human-Robot Collaboration". 29th IEEE International Conference on Robot and Human Interactive Communication (RO-MAN). 2020. Pages 1204-1210.

[5] Pellegrinelli S., Orlandini A., Pedrocchi N., Umbrico A., Tolio T. "Motion planning and scheduling for human and industrial-robot collaboration". CIRP Annals.
Volume 66, Issue 1. 2017. Pages 1-4.
