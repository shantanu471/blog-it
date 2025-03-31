import React from "react";

import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import { Redirect } from "react-router-dom/cjs/react-router-dom.min";
import { ToastContainer } from "react-toastify";

import BlogPosts from "components/BlogPosts";

const App = () => {
  return (
    <Router>
      <ToastContainer />
      <Switch>
        <Route exact path="/blogs" component={BlogPosts} />
        <Redirect path="*" to="/blogs" />
      </Switch>
    </Router>
  );
};

export default App;
