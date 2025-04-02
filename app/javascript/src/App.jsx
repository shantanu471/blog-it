import React from "react";

import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
import { Redirect } from "react-router-dom/cjs/react-router-dom.min";
import { ToastContainer } from "react-toastify";
import CreatePost from "components/CreatePost";
import ShowPost from "./components/ShowPost";

import BlogPosts from "components/BlogPosts";
import Sidebar from "./components/Sidebar";

const App = () => {
  return (
    <Router>
      <ToastContainer />
      <Sidebar />
      <Switch>
        <Route exact component={ShowPost} path="/posts/:slug/show" />
        <Route exact component={CreatePost} path="/posts/create" />
        <Route exact path="/blogs" component={BlogPosts} />
        <Redirect path="*" to="/blogs" />
      </Switch>
    </Router>
  );
};

export default App;
