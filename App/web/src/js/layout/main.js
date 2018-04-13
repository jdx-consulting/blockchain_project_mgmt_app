import React from "react";
import { Switch, Route } from 'react-router-dom'
import { Home } from "../content/home";
import { TimeEntry } from "../content/entry";
import { TimeReporting } from "../content/reporting";
import { Approval } from "../content/approval";

export const Main = () => (
  <main class="container-fluid">
    <Switch>
      <Route exact path='/' component={Home}/>
      <Route path='/entry' component={TimeEntry}/>
      <Route path='/report' component={TimeReporting}/>
      <Route path='/approve' component={Approval}/>
    </Switch>
  </main>
)