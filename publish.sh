#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  PUBLISH=publishSigned
else
  PUBLISH=$1
fi

publish() {
  LIFT_VERSION="set liftVersion in ThisBuild := \"$1\""
  CROSS_SCALA="set crossScalaVersions := Seq($2)"

  sbt "$LIFT_VERSION" "$CROSS_SCALA" clean "+ update" "+ test" "+ $PUBLISH"
}

sbt clean jasmine

publish "3.2.0-M2" '"2.12.3"'
publish "3.2.0-M2" '"2.11.11"'
publish "3.1.0" '"2.11.11"'
publish "3.0.1" '"2.11.11"'
publish "2.6.3" '"2.11.11", "2.10.6"'
publish "2.5.4" '"2.10.6"'
