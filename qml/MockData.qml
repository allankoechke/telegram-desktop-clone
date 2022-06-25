import QtQuick 2.0
import QtQml.Models 2.11

Item {
    property alias chatsModel: chatsModel

    ListModel {
        id: chatsModel

        ListElement {
            uid: 13
            chatType: "chat"
            chatName: "Festus Mikes"
            chatLastMessage: "Festus: It was a capacity building session"
            chatIcon: ""
            chatLastTextDate: "18:00"
        }

        ListElement {
            uid: 12
            chatType: "chat"
            chatName: "Emily Homes"
            chatLastMessage: "You: Yes, ill keep you posted"
            chatIcon: "qrc:/assets/images/user2"
            chatLastTextDate: "16:45"
        }

        ListElement {
            uid: 11
            chatType: "chat"
            chatName: "Braun Lee"
            chatLastMessage: "You: Yes, ill keep you posted"
            chatIcon: "qrc:/assets/images/user3"
            chatLastTextDate: "17:34"
        }

        ListElement {
            uid: 10
            chatType: "chat"
            chatName: "Monica Elly"
            chatLastMessage: "You: Well noted boss"
            chatIcon: ""
            chatLastTextDate: "13:08"
        }

        ListElement {
            uid: 1
            chatType: "group"
            chatName: "The Expandables"
            chatLastMessage: "Nick: I think we can get a recording of the same"
            chatIcon: "qrc:/assets/images/group1"
            chatLastTextDate: "11:00"
        }

        ListElement {
            uid: 2
            chatType: "group"
            chatName: "Cricket Team"
            chatLastMessage: "You: Ill play next time"
            chatIcon: ""
            chatLastTextDate: "Wed"
        }

        ListElement {
            uid: 3
            chatType: "group"
            chatName: "Conference Planning Committee"
            chatLastMessage: "Barbara: I already sent the emails"
            chatIcon: "qrc:/assets/images/group1"
            chatLastTextDate: "Wed"
        }

        ListElement {
            uid: 4
            chatType: "chat"
            chatName: "Mathew Jones"
            chatLastMessage: "You: Yes, ill keep you posted"
            chatIcon: ""
            chatLastTextDate: "Tue"
        }

        ListElement {
            uid: 5
            chatType: "chat"
            chatName: "Nick Jones"
            chatLastMessage: "You: Okay"
            chatIcon: ""
            chatLastTextDate: "Tue"
        }

        ListElement {
            uid: 6
            chatType: "channel"
            chatName: "Latest Fixtures for EPL"
            chatLastMessage: "You: Thats noted man"
            chatIcon: "qrc:/assets/images/group1"
            chatLastTextDate: "Mon"
        }
    }
}
