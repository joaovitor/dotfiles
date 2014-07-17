#!/bin/sh

JAVA_LIB_DIR=$HOME/programs/java/lib
JAVA_SDK_DIR=$HOME/programs/java/sdks
JAVA_LANG_DIR=$HOME/programs/java/languages
JAVA_PROG_DIR=$HOME/programs/java/programs
JAVA_SERVERS_DIR=$HOME/programs/java/servers

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

export ANT_HOME=$JAVA_PROG_DIR/ant
export PATH=$ANT_HOME/bin:$PATH

export MVN_HOME=$JAVA_PROG_DIR/maven
export PATH=$MVN_HOME/bin:$PATH

export GRADLE_HOME=$JAVA_PROG_DIR/gradle
export PATH=$GRADLE_HOME/bin:$PATH

#export ROO_HOME=$JAVA_PROG_DIR/spring-roo
#export PATH=$ROO_HOME/bin:$PATH

#export AWS_IAM_HOME=$JAVA_PROG_DIR/IAMCli
#export PATH=$AWS_IAM_HOME/bin:$PATH

#export SCALA_HOME=$JAVA_LANG_DIR/scala
#export PATH=$SCALA_HOME/bin:$PATH

#export GROOVY_HOME=$JAVA_LANG_DIR/groovy
#export PATH=$GROOVY_HOME/bin:$PATH

#export GRAILS_HOME=$JAVA_PROG_DIR/grails
#export PATH=$GRAILS_HOME/bin:$PATH

#export TOMCAT_HOME=$JAVA_SERVERS_DIR/tomcat

#export ANDROID_HOME=$JAVA_SDK_DIR/android
#export PATH=$ANDROID_HOME/tools:$PATH
