/****************************************************************************
 *
 * (c) 2009-2020 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick              2.3
import QtQuick.Controls     1.2
import QtGraphicalEffects   1.0
import QtQuick.Layouts      1.2

import QGroundControl.FactSystem    1.0
import QGroundControl.FactControls  1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0

SetupPage {
    id:             safetyPage
    pageComponent:  safetyPageComponent

    Component {
        id: safetyPageComponent

        Flow {
            id:         flowLayout
            width:      availableWidth
            spacing:    _margins

            FactPanelController { id: controller; }

            QGCPalette { id: ggcPal; colorGroupEnabled: true }

            property real _margins:     ScreenTools.defaultFontPixelHeight
            property bool _showIcon:    !ScreenTools.isTinyScreen

            property Fact _hThrottleIdle:   controller.getParameterFact(-1, "H_THROTTLE_IDLE")
            property Fact _hThrottleRamp:   controller.getParameterFact(-1, "H_THROTTLE_RAMP")
            property Fact _hThrottleP1:     controller.getParameterFact(-1, "H_THROTTLE_P1")
            property Fact _hThrottleP2:     controller.getParameterFact(-1, "H_THROTTLE_P2")
            property Fact _hThrottleP3:     controller.getParameterFact(-1, "H_THROTTLE_P3")
            property Fact _hThrottleP4:     controller.getParameterFact(-1, "H_THROTTLE_P4")
            property Fact _hThrottleP5:     controller.getParameterFact(-1, "H_THROTTLE_P5")
            property Fact _hThrottle2P1:    controller.getParameterFact(-1, "H_THROTTLE2_P1")
            property Fact _hThrottle2P2:    controller.getParameterFact(-1, "H_THROTTLE2_P2")
            property Fact _hThrottle2P3:    controller.getParameterFact(-1, "H_THROTTLE2_P3")
            property Fact _hThrottle2P4:    controller.getParameterFact(-1, "H_THROTTLE2_P4")
            property Fact _hThrottle2P5:    controller.getParameterFact(-1, "H_THROTTLE2_P5")
            
            property Fact _hNumEngines:     controller.getParameterFact(-1, "H_NUM_ENGINES")

            property Fact _hRotorRpm:       controller.getParameterFact(-1, "H_ROTOR_RPM")
            property Fact _hRotorCritical:  controller.getParameterFact(-1, "H_ROTOR_CRITICAL")
            property Fact _hRotorRunup:     controller.getParameterFact(-1, "H_ROTOR_RUNUP")
            property Fact _hGovDroop:       controller.getParameterFact(-1, "H_GOV_DROOP")
            property Fact _hGov2Droop:      controller.getParameterFact(-1, "H_GOV2_DROOP")
            property Fact _hGovTorque:      controller.getParameterFact(-1, "H_GOV_TORQUE")
            property Fact _hGovTcgain:      controller.getParameterFact(-1, "H_GOV_TCGAIN")
            property Fact _hGov2Tcgain:     controller.getParameterFact(-1, "H_GOV2_TCGAIN")

            property Fact _Ch6Opt:          controller.getParameterFact(-1, "TUNE")
            property Fact _Ch9Opt:          controller.getParameterFact(-1, "CH9_OPT")
            property Fact _Ch10Opt:         controller.getParameterFact(-1, "CH10_OPT")
            property Fact _Ch11Opt:         controller.getParameterFact(-1, "CH11_OPT")
            property Fact _Ch12Opt:         controller.getParameterFact(-1, "CH12_OPT")

            property Fact _hSwashSetup:     controller.getParameterFact(-1, "H_SWASH_SETUP")
            property Fact _hSwashType:      controller.getParameterFact(-1, "H_SWASH_TYPE")
            property Fact _hSwashCollDir:   controller.getParameterFact(-1, "H_SWASH_COLL_DIR")
            property Fact _hSwashLinear:    controller.getParameterFact(-1, "H_SWASH_LINEAR")
            property Fact _hCyclicDeg:      controller.getParameterFact(-1, "H_CYCLIC_DEG")

            property Fact _hColMax:         controller.getParameterFact(-1, "H_COL_MAX")
            property Fact _hColMid:         controller.getParameterFact(-1, "H_COL_MID")
            property Fact _hColMin:         controller.getParameterFact(-1, "H_COL_MIN")
            property Fact _hColYaw:         controller.getParameterFact(-1, "H_COL_YAW")

            property Fact _imStabCol1:      controller.getParameterFact(-1, "IM_STAB_COL_1")
            property Fact _imStabCol2:      controller.getParameterFact(-1, "IM_STAB_COL_2")
            property Fact _imStabCol3:      controller.getParameterFact(-1, "IM_STAB_COL_3")
            property Fact _imStabCol4:      controller.getParameterFact(-1, "IM_STAB_COL_4")

            QGCGroupBox {
                title: qsTr("<b>Servo Group</b>")

                GridLayout {
                    columns: 6

                    QGCLabel { text: qsTr("<b>Output </b>") }
                    QGCLabel { text: qsTr("<b> Function</b>") }
                    QGCLabel { text: qsTr("<b>Min</b>") }
                    QGCLabel { text: qsTr("<b>Max</b>") }
                    QGCLabel { text: qsTr("<b>Trim</b>") }
                    QGCLabel { text: qsTr("<b>Reverse</b>") }

                    QGCLabel { text: qsTr("Port1") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO1_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO1_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO1_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO1_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO1_REVERSED")
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("Port2") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO2_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO2_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO2_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO2_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO2_REVERSED")
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("Port3") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO3_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO3_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO3_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO3_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO3_REVERSED")
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("Port4") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO4_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO4_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO4_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO4_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO4_REVERSED")
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("Port5") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO5_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO5_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO5_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO5_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO5_REVERSED")
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("Port6") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO6_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO6_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO6_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO6_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO6_REVERSED")
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("Port7") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO7_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO7_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO7_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO7_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO7_REVERSED")
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("Port8") }
                    FactComboBox {
                        fact:               controller.getParameterFact(-1, "SERVO8_FUNCTION")
                        indexModel:         false
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO8_MIN")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO8_MAX")
                        Layout.fillWidth:   true
                    }
                    FactTextField {
                        fact:               controller.getParameterFact(-1, "SERVO8_TRIM")
                        Layout.fillWidth:   true
                    }
                    FactCheckBox {
                        fact:               controller.getParameterFact(-1, "SERVO8_REVERSED")
                        Layout.fillWidth:   true
                    }
                }
            }

            QGCGroupBox {
                title: qsTr("<b>Throttle Group</b>")

                GridLayout {
                    columns: 2

                    QGCLabel { text: _hThrottleIdle.shortDescription }
                    FactTextField { fact: _hThrottleIdle }

                    QGCLabel { text: _hThrottleRamp.shortDescription }
                    FactTextField { fact: _hThrottleRamp }

                    QGCLabel { text: qsTr("<b>_______ Throttle Curve</b>") }
                    QGCLabel { text: qsTr("<b>______________________</b>") }

                    QGCLabel { text: _hThrottleP1.shortDescription }
                    FactTextField { fact: _hThrottleP1 }

                    QGCLabel { text: _hThrottleP2.shortDescription }
                    FactTextField { fact: _hThrottleP2 }

                    QGCLabel { text: _hThrottleP3.shortDescription }
                    FactTextField { fact: _hThrottleP3 }

                    QGCLabel { text: _hThrottleP4.shortDescription }
                    FactTextField { fact: _hThrottleP4 }

                    QGCLabel { text: _hThrottleP5.shortDescription }
                    FactTextField { fact: _hThrottleP5 }
                }
            }

            QGCGroupBox {
                title: qsTr("<b>Rotor and Governor Group</b>")

                GridLayout {
                    columns: 2

                    QGCLabel { text: _hRotorRpm.shortDescription }
                    FactTextField { fact: _hRotorRpm }

                    QGCLabel { text: _hRotorCritical.shortDescription }
                    FactTextField { fact: _hRotorCritical }

                    QGCLabel { text: _hRotorRunup.shortDescription }
                    FactTextField { fact: _hRotorRunup }

                    QGCLabel { text: qsTr("<b>______________ Governor Settings</b>") }
                    QGCLabel { text: qsTr("<b>______________________</b>") }

                    QGCLabel { text: _hGovDroop.shortDescription }
                    FactTextField { fact: _hGovDroop }

                    QGCLabel { text: _hGovTorque.shortDescription }
                    FactTextField { fact: _hGovTorque }

                    QGCLabel { text: _hGovTcgain.shortDescription }
                    FactTextField { fact: _hGovTcgain }
                }
            }

            QGCGroupBox {
                title: qsTr("<b>Channel Function Group</b>")

                GridLayout {
                    columns: 2

                    QGCLabel { text: qsTr("<b> RC Channel ___</b>") }
                    QGCLabel { text: qsTr("<b>Function ___</b>") }

                    QGCLabel { text: _Ch6Opt.shortDescription }
                    FactComboBox {
                        fact:       _Ch6Opt
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: _Ch9Opt.shortDescription }
                    FactComboBox {
                        fact:       _Ch9Opt
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: _Ch10Opt.shortDescription }
                    FactComboBox {
                        fact:       _Ch10Opt
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: _Ch11Opt.shortDescription }
                    FactComboBox {
                        fact:       _Ch11Opt
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: _Ch12Opt.shortDescription }
                    FactComboBox {
                        fact:       _Ch12Opt
                        indexModel: false
                        Layout.fillWidth:   true
                    }
                }
            }

            QGCGroupBox {
                title: qsTr("<b>Swashplate and Cyclic Group</b>")

                GridLayout {
                    columns: 2

                    QGCLabel { text: _hSwashSetup.shortDescription }
                    FactComboBox {
                        fact:       _hSwashSetup
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: _hSwashType.shortDescription }
                    FactComboBox {
                        fact:       _hSwashType
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: _hSwashCollDir.shortDescription }
                    FactComboBox {
                        fact:       _hSwashCollDir
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("<b>__________ Four-Servo Only</b>") }
                    QGCLabel { text: qsTr("<b>_____________________</b>") }

                    QGCLabel { text: _hSwashLinear.shortDescription }
                    FactComboBox {
                        fact:       _hSwashLinear
                        indexModel: false
                        Layout.fillWidth:   true
                    }

                    QGCLabel { text: qsTr("<b>___________ Cyclic Settings</b>") }
                    QGCLabel { text: qsTr("<b>______________________</b>") }

                    QGCLabel { text: _hCyclicDeg.shortDescription }
                    FactTextField { fact: _hCyclicDeg }
                }
            }

            QGCGroupBox {
                title: qsTr("<b>Collective Group</b>")

                GridLayout {
                    columns: 2

                    QGCLabel { text: _hColMid.shortDescription }
                    FactTextField { fact: _hColMid }

                    QGCLabel { text: _hColMin.shortDescription }
                    FactTextField { fact: _hColMin }

                    QGCLabel { text: _hColMax.shortDescription }
                    FactTextField { fact: _hColMax }

                    QGCLabel { text: _hColYaw.shortDescription }
                    FactTextField { fact: _hColYaw }
                }
            }

            QGCGroupBox {
                title: qsTr("<b>Stabilize Collective Curve</b>")

                GridLayout {
                    columns: 2

                    QGCLabel { text: _imStabCol1.shortDescription }
                    FactTextField { fact: _imStabCol1 }

                    QGCLabel { text: _imStabCol2.shortDescription }
                    FactTextField { fact: _imStabCol2 }

                    QGCLabel { text: _imStabCol3.shortDescription }
                    FactTextField { fact: _imStabCol3 }

                    QGCLabel { text: _imStabCol4.shortDescription }
                    FactTextField { fact: _imStabCol4 }
                }
            }
            
                        QGCGroupBox {
                title: qsTr("<b>Twin-Engine Helicopters</b>")

                GridLayout {
                    columns: 2
                    
                    QGCLabel { text: _hNumEngines.shortDescription }
                    FactTextField { fact: _hNumEngines }

                    QGCLabel { text: qsTr("<b>______________ Throttle Curve</b>") }
                    QGCLabel { text: qsTr("<b>______________________</b>") }

                    QGCLabel { text: _hThrottle2P1.shortDescription }
                    FactTextField { fact: _hThrottle2P1 }

                    QGCLabel { text: _hThrottle2P2.shortDescription }
                    FactTextField { fact: _hThrottle2P2 }

                    QGCLabel { text: _hThrottle2P3.shortDescription }
                    FactTextField { fact: _hThrottle2P3 }

                    QGCLabel { text: _hThrottle2P4.shortDescription }
                    FactTextField { fact: _hThrottle2P4 }

                    QGCLabel { text: _hThrottle2P5.shortDescription }
                    FactTextField { fact: _hThrottle2P5 }
                    
                    QGCLabel { text: qsTr("<b>___________ Governor Settings</b>") }
                    QGCLabel { text: qsTr("<b>______________________</b>") }

                    QGCLabel { text: _hGov2Droop.shortDescription }
                    FactTextField { fact: _hGov2Droop }

                    QGCLabel { text: _hGov2Tcgain.shortDescription }
                    FactTextField { fact: _hGov2Tcgain }
                }
            }
        } // Flow
    } // Component
} // SetupView
