import React from "react";
import ReactDOM from "react-dom";
import { App, AppTitle } from "./app";
// import { OpenFinVersion } from "./layout/footer";
import style from "../main.css";
import { HashRouter } from 'react-router-dom'

ReactDOM.render((
  <HashRouter>
    <App />
  </HashRouter>
), document.getElementById('root'));

ReactDOM.render(
    <AppTitle title="JDX Time Management" />,
    document.getElementById('theTitle')
  );

console.log('In Index.js');

/*
const PopUp = () => {
    

    var notification = new fin.desktop.Notification({
        //The HTML page containing the content of the Notification/
        url: "http://localhost:8080/web/src/notifications/appStarted.html",
        //'message' is where you may pass initial parameters
        message: { lab: "Check out da' BBC...", link: "http://www.bbc.co.uk" },
        onClick: function () {
            console.log("clicked");
        },
        onClose: function () {
        // Invoked when the 'close()' method is called.
            console.log("closed");
        },
        onDismiss: function () {
        //This is invoked when the notification is swiped right to dismiss. 
        //It is esentially the same as clove via a different method.
            console.log("dismissed");
        },
        onError: function (reason) {
            console.log("error: " + reason);
        },
        onMessage: function (message) {
        //Invoked when the 
            console.log("message: ", message);
        },
        onShow: function () {
            console.log("shown");
        }
    });
};

var isOpenFin = ('fin' in window && 'desktop' in fin);


if(isOpenFin) {

    const app = fin.desktop.Application.getCurrent();
    fin.desktop.System.showDeveloperTools(app.uuid, app.uuid);
    fin.desktop.System.getVersion(version => {
        console.log('OpenFin Version: ' + version);
        //const ofVersion = document.querySelector('#of-version');
        //ofVersion.innerText = version;

        ReactDOM.render(
            <OpenFinVersion openFinVersion={version} />,
            document.getElementById('theFooter')
            );
    });
    PopUp();
}
else {
    ReactDOM.render(
            <h1>Browser.</h1>,
            document.getElementById('theFooter')
            );
}



ReactDOM.render(
  <LoggedInUser name="Matthew" />,
  document.getElementById('app')
);

*/


console.log('Out Index.js');