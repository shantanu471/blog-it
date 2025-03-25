import React from "react";

import Sidebar from "components/Sidebar";
import Posts from "../Posts";

 const BlogPosts = () => (
   <div className="flex">
     <Sidebar />
     <main className="ml-24 flex-1">
      <Posts />
     </main>
   </div>
 );

 export default BlogPosts;
