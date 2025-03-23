import React from "react";

import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import { Redirect } from "react-router-dom/cjs/react-router-dom.min";

 import BlogPosts from "components/BlogPosts";
 import Lists from "components/Lists";

const App = () => {
  return (
    <Router>
      <Switch>
        <Route exact path="/blogs" component={BlogPosts} />
        <Route exact path="/lists" component={Lists} />
        <Redirect path="*" to="/blogs" />
      </Switch>
    </Router>
  );
};

export default App;
