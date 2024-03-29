import QtQuick 2.0

Rectangle {
	id: root
	color: "white"
	state: "off-screen"

	function disappear() { root.state = "off-screen" }
	function appear() { root.state = "on-screen" }
	function setY(new_y) { root.y = new_y }
	function setHeight(new_height) { root.height = new_height }

	states:
		[ State {
				name: "off-screen"
				PropertyChanges { target: root; opacity: 0; visible: false }
			},
			State {
				name: "on-screen"
				PropertyChanges { target: root; opacity: 1; visible: true }
			} ]

	transitions:
		Transition {
				from: "off-screen"; to: "on-screen"
				SequentialAnimation {
						PropertyAnimation { properties: "visible" }
						NumberAnimation { properties: "opacity"; easing.type: Easing.InOutQuad; duration: 200 }
				}
		}
}
