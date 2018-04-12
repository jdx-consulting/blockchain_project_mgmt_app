import React from "react";


// Functional Components
export function Welcome(props) {
  return (
    <div>
        <h1>Hello, {props.name}</h1>
        <h2>Welcome to our OpenFin DAPP</h2>
    </div>
  );
}

export const Hello = (props) => { return <title>Hi {props.name}.</title>; };


