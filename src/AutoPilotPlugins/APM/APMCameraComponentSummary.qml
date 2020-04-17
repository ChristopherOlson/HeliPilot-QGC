import QtQuick          2.3
import QtQuick.Controls 1.2

import QGroundControl.FactSystem    1.0
import QGroundControl.FactControls  1.0
import QGroundControl.Controls      1.0
import QGroundControl.Palette       1.0

Item {
    anchors.fill:   parent

    FactPanelController { id: controller; }

    // HeliPilot v20.04 does not have camera controls
    property bool   _mountRCInTiltExists: controller.parameterExists(-1, "MNT_RC_IN_TILT")
    property string _mountRCInTiltValue: _mountRCInTiltExists ? controller.getParameterFact(-1, "MNT_RC_IN_TILT").enumStringValue : ""
    
    property bool   _mountRCInRollExists: controller.parameterExists(-1, "MNT_RC_IN_ROLL")
    property string _mountRCInRollValue: _mountRCInRollExists ? controller.getParameterFact(-1, "MNT_RC_IN_ROLL").enumStringValue : ""
    
    property bool   _mountRCInPanExists: controller.parameterExists(-1, "MNT_RC_IN_PAN")
    property string _mountRCInPanValue: _mountRCInPanExists ? controller.getParameterFact(-1, "MNT_RC_IN_PAN").enumStringValue : ""

    // MNT_TYPE parameter is not in older firmware versions
    property bool   _mountTypeExists: controller.parameterExists(-1, "MNT_TYPE")
    property string _mountTypeValue: _mountTypeExists ? controller.getParameterFact(-1, "MNT_TYPE").enumStringValue : ""

    Column {
        anchors.fill:       parent

        VehicleSummaryRow {
            visible:    _mountTypeExists
            labelText:  qsTr("Gimbal type")
            valueText:  _mountTypeValue
        }

        VehicleSummaryRow {
            visible:    _mountRCInTiltExists
            labelText:  qsTr("Tilt input channel")
            valueText:  _mountRCInTiltValue
        }

        VehicleSummaryRow {
            visible:    _mountRCInRollExists
            labelText:  qsTr("Roll input channel")
            valueText:  _mountRCInRollValue
        }

        VehicleSummaryRow {
            visible:    _mountRCInPanExists
            labelText:  qsTr("Pan input channel")
            valueText:  _mountRCInPanValue
        }
    }
}
