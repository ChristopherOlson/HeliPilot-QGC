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
import QtQuick.Layouts      1.2

import QGroundControl.FactSystem    1.0
import QGroundControl.FactControls  1.0
import QGroundControl.Palette       1.0
import QGroundControl.Controls      1.0
import QGroundControl.ScreenTools   1.0

SetupPage {
    id:             tuningPage
    pageComponent:  tuningPageComponent

    Component {
        id: tuningPageComponent

        Column {
            width: availableWidth

            FactPanelController { id: controller; }

            property Fact _ratePitchVff:        controller.getParameterFact(-1, "ATC_RAT_RLL_VFF")
            property Fact _rateRollVff:         controller.getParameterFact(-1, "ATC_RAT_PIT_VFF")
            property Fact _rateRollP:           controller.getParameterFact(-1, "ATC_RAT_RLL_P")
            property Fact _rateRollI:           controller.getParameterFact(-1, "ATC_RAT_RLL_I")
            property Fact _ratePitchP:          controller.getParameterFact(-1, "ATC_RAT_PIT_P")
            property Fact _ratePitchI:          controller.getParameterFact(-1, "ATC_RAT_PIT_I")
            property Fact _rateYawVff:          controller.getParameterFact(-1, "ATC_RAT_YAW_VFF")
            property Fact _rateYawP:            controller.getParameterFact(-1, "ATC_RAT_YAW_P")
            property Fact _rateYawI:            controller.getParameterFact(-1, "ATC_RAT_YAW_I")
            property Fact _rateYawD:            controller.getParameterFact(-1, "ATC_RAT_YAW_D")

            property real _margins: ScreenTools.defaultFontPixelHeight

            property bool _loadComplete: false

            ExclusiveGroup { id: fenceActionRadioGroup }
            ExclusiveGroup { id: landLoiterRadioGroup }
            ExclusiveGroup { id: returnAltRadioGroup }

            Component.onCompleted: {
                // We use QtCharts only on Desktop platforms
                showAdvanced = !ScreenTools.isMobile

                // Qml Sliders have a strange behavior in which they first set Slider::value to some internal
                // setting and then set Slider::value to the bound properties value. If you have an onValueChanged
                // handler which updates your property with the new value, this first value change will trash
                // your bound values. In order to work around this we don't set the values into the Sliders until
                // after Qml load is done. We also don't track value changes until Qml load completes.
                rollPitchVff.value = _rateRollVff.value * 1000
                rollPitchP.value = _rateRollP.value * 1000
                rollPitchI.value = _rateRollI.value * 1000
                rateYawVff.value = _rateYawVff.value * 1000
                rateYawP.value = _rateYawP.value * 1000
                rateYawI.value = _rateYawI.value * 1000
                rateYawD.value = _rateYawD.value * 10000
                _loadComplete = true
            }

            Column {
                anchors.left:       parent.left
                anchors.right:      parent.right
                spacing:            _margins
                visible:            !advanced

                QGCLabel {
                    text:       qsTr("Basic Rate Controller Tuning")
                    font.family: ScreenTools.demiboldFontFamily
                }

                Rectangle {
                    id:                 basicTuningRect
                    anchors.left:       parent.left
                    anchors.right:      parent.right
                    height:             basicTuningColumn.y + basicTuningColumn.height + _margins
                    color:              qgcPal.windowShade

                    Column {
                        id:                 basicTuningColumn
                        anchors.margins:    _margins
                        anchors.left:       parent.left
                        anchors.right:      parent.right
                        anchors.top:        parent.top
                        spacing:            _margins

                        Column {
                            anchors.left:       parent.left
                            anchors.right:      parent.right

                            QGCLabel {
                                text:       qsTr("Rate Controller Roll/Pitch FeedForward (VFF)")
                                font.family: ScreenTools.demiboldFontFamily
                            }

                            QGCLabel {
                                text: qsTr("left to right range: 0.05 to 0.25 - The slider will set both axes to the same value for basic tuning")
                            }

                            Slider {
                                id:                 rollPitchVff
                                anchors.left:       parent.left
                                anchors.right:      parent.right
                                minimumValue:       50
                                maximumValue:       250
                                stepSize:           2
                                tickmarksEnabled:   true

                                onValueChanged: {
                                    if (_loadComplete) {
                                        _ratePitchVff.value = value * 0.001
                                        _rateRollVff.value = value * 0.001
                                    }
                                }
                            }
                        }

                        Column {
                            anchors.left:       parent.left
                            anchors.right:      parent.right

                            QGCLabel {
                                text:       qsTr("Rate Controller Roll/Pitch P-Gain")
                                font.family: ScreenTools.demiboldFontFamily
                            }

                            QGCLabel {
                                text: qsTr("left to right range: 0 to 0.10 - The slider will set both axes to the same value for basic tuning")
                            }

                            Slider {
                                id:                 rollPitchP
                                anchors.left:       parent.left
                                anchors.right:      parent.right
                                minimumValue:       0
                                maximumValue:       100
                                stepSize:           1
                                tickmarksEnabled:   true

                                onValueChanged: {
                                    if (_loadComplete) {
                                        _rateRollP.value = value * 0.001
                                        _ratePitchP.value = value * 0.001
                                    }
                                }
                            }
                        }

                        Column {
                            anchors.left:       parent.left
                            anchors.right:      parent.right

                            QGCLabel {
                                text:       qsTr("Rate Controller Roll/Pitch I-gain")
                                font.family: ScreenTools.demiboldFontFamily
                            }

                            QGCLabel {
                                text: qsTr("left to right range: 0 to 0.40 - The slider will set both axes to the same value for basic tuning")
                            }

                            Slider {
                                id:                 rollPitchI
                                anchors.left:       parent.left
                                anchors.right:      parent.right
                                minimumValue:       0
                                maximumValue:       400
                                stepSize:           1
                                tickmarksEnabled:   true

                                onValueChanged: {
                                    if (_loadComplete) {
                                        _ratePitchI.value = value * 0.001
                                        _rateRollI.value = value * 0.001
                                    }
                                }
                            }
                        }
                        
                        Column {
                            anchors.left:       parent.left
                            anchors.right:      parent.right

                            QGCLabel {
                                text:       qsTr("Rate Controller Yaw FeedForward (VFF)")
                                font.family: ScreenTools.demiboldFontFamily
                            }

                            QGCLabel {
                                text: qsTr("left to right range: 0.0 to 0.25")
                            }

                            Slider {
                                id:                 rateYawVff
                                anchors.left:       parent.left
                                anchors.right:      parent.right
                                minimumValue:       0
                                maximumValue:       250
                                stepSize:           2
                                tickmarksEnabled:   true

                                onValueChanged: {
                                    if (_loadComplete) {
                                        _rateYawVff.value = value * 0.001
                                    }
                                }
                            }
                        }

                        Column {
                            anchors.left:       parent.left
                            anchors.right:      parent.right

                            QGCLabel {
                                text:       qsTr("Rate Controller Yaw P-gain")
                                font.family: ScreenTools.demiboldFontFamily
                            }

                            QGCLabel {
                                text: qsTr("left to right range: 0.10 to 0.30")
                            }

                            Slider {
                                id:                 rateYawP
                                anchors.left:       parent.left
                                anchors.right:      parent.right
                                minimumValue:       100
                                maximumValue:       300
                                stepSize:           2
                                tickmarksEnabled:   true

                                onValueChanged: {
                                    if (_loadComplete) {
                                        _rateYawP.value = value * 0.001
                                    }
                                }
                            }
                        }

                        Column {
                            anchors.left:       parent.left
                            anchors.right:      parent.right

                            QGCLabel {
                                text:       qsTr("Rate Controller Yaw I-gain")
                                font.family: ScreenTools.demiboldFontFamily
                            }

                            QGCLabel {
                                text: qsTr("left to right range: 0 to 0.30")
                            }

                            Slider {
                                id:                 rateYawI
                                anchors.left:       parent.left
                                anchors.right:      parent.right
                                minimumValue:       0
                                maximumValue:       300
                                stepSize:           3
                                tickmarksEnabled:   true

                                onValueChanged: {
                                    if (_loadComplete) {
                                        _rateYawI.value = value * 0.001
                                    }
                                }
                            }
                        }
                        
                        Column {
                            anchors.left:       parent.left
                            anchors.right:      parent.right

                            QGCLabel {
                                text:       qsTr("Rate Controller Yaw D-gain")
                                font.family: ScreenTools.demiboldFontFamily
                            }

                            QGCLabel {
                                text: qsTr("left to right range: 0 to 0.008")
                            }

                            Slider {
                                id:                 rateYawD
                                anchors.left:       parent.left
                                anchors.right:      parent.right
                                minimumValue:       0
                                maximumValue:       80
                                stepSize:           1
                                tickmarksEnabled:   true

                                onValueChanged: {
                                    if (_loadComplete) {
                                        _rateYawD.value = value * 0.0001
                                    }
                                }
                            }
                        }
                    }
                } // Rectangle - Basic tuning
            }

            Loader {
                anchors.left:       parent.left
                anchors.right:      parent.right
                sourceComponent:    advanced ? advancePageComponent : undefined
            }

            Component {
                id: advancePageComponent

                PIDTuning {
                    anchors.left:   parent.left
                    anchors.right:  parent.right
                    tuneList:            [ qsTr("Roll"), qsTr("Pitch"), qsTr("Yaw") ]
                    params:              [
                        [ controller.getParameterFact(-1, "ATC_ANG_RLL_P"),
                         controller.getParameterFact(-1, "ATC_RAT_RLL_P"),
                         controller.getParameterFact(-1, "ATC_RAT_RLL_I"),
                         controller.getParameterFact(-1, "ATC_RAT_RLL_D") ],
                        [ controller.getParameterFact(-1, "ATC_ANG_PIT_P"),
                         controller.getParameterFact(-1, "ATC_RAT_PIT_P"),
                         controller.getParameterFact(-1, "ATC_RAT_PIT_I"),
                         controller.getParameterFact(-1, "ATC_RAT_PIT_D") ],
                        [ controller.getParameterFact(-1, "ATC_ANG_YAW_P"),
                         controller.getParameterFact(-1, "ATC_RAT_YAW_P"),
                         controller.getParameterFact(-1, "ATC_RAT_YAW_I") ] ]
                }
            } // Component - Advanced Page
        } // Column
    } // Component
} // SetupView
