import React from "react";
import { Header } from "./layout/header";
import { Main } from "./layout/main";

export const App = () => (
  <div>
    <Header />
    <Main />
  </div>
)

export const AppTitle = (props) => { return <title>{props.title}.</title>; };


