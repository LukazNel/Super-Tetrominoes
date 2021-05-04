import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
	id: root
	state: "visible"

	property alias backgroundColor: background.color

	function disappear() { root.state = "retracted" }
	function appear() { root.state = "visible" }

	signal quitButtonPressed()
	signal startButtonPressed()

	Rectangle {
			id: background
			anchors.fill: parent
	}

	Column {
			anchors.verticalCenter: parent.verticalCenter
			anchors.horizontalCenter: parent.horizontalCenter
			spacing: 2

			Button {
					id: startButton
					width: button_w
					height: button_h
					text: "Start"
					onClicked: startButtonPressed()
			}

			Button {
				id: quitButton
				width: button_w
				height: button_h
				text: "Quit"
				onClicked: quitButtonPressed()
			}
	}

	states:
			[ State {
					name: "retracted"
					PropertyChanges { target: root; y: -height; visible: false; focus: false }
				},
				State {
					name: "visible"
					PropertyChanges { target: root; y: 0; visible: true; focus: true }
				} ]

	transitions:
			Transition {
					from: "visible"; to: "retracted"; reversible: true
					SequentialAnimation {
							NumberAnimation { properties: "y"; easing.type: Easing.InOutQuad; duration: 500 }
							PropertyAnimation { properties: "visible, focus" }
					}
			}
}
