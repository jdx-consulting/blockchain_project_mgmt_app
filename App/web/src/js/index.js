import React from "react";
import ReactDOM from "react-dom";
import { Welcome, Hello } from "./app";
import style from "../main.css";

console.log('In Index.js');


var isOpenFin = ('fin' in window && 'desktop' in fin);


if(isOpenFin) {

    const app = fin.desktop.Application.getCurrent();
    fin.desktop.System.showDeveloperTools(app.uuid, app.uuid);
    fin.desktop.System.getVersion(version => {
        console.log('OpenFin Version: ' + version);
        //const ofVersion = document.querySelector('#of-version');
        //ofVersion.innerText = version;
    });
}

ReactDOM.render(
  <Hello name="Matt" />,
  document.getElementById('theTitle')
);

ReactDOM.render(
  <Welcome name="Matthew" />,
  document.getElementById('app')
);


console.log('Out Index.js');