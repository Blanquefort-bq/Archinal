import QtQuick
import "../../config"
import "../../services"  

Item {


    id: root


    width: parent.width


    height: 170



    property string app





    property var items:


        Notifications.notifications.filter(

            function(n){

                return n.app === root.app

            }

        )






    Repeater {


        model:

            Math.min(
                items.length,
                3
            )



        delegate:


            NotificationCard {


                x: index * 15

                y: index * 15


                z: 3-index



                sender:
                    items[index].sender


                app:
                    items[index].app


                message:
                    items[index].message


                time:
                    items[index].time



                notificationId:
                    items[index].id


                onClosed:

                    Notifications.remove(
                        notificationId
                    )


            }

    }

}