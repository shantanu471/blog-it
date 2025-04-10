import React from "react";

import { Book, Edit, List } from "@bigbinary/neeto-icons";
import { NavLink } from "react-router-dom";
import { Avatar } from "@bigbinary/neetoui";

const Sidebar = () => (
  <div className="fixed flex h-screen w-16 flex-col items-center border-r border-gray-200 bg-white py-4">

    <Book className="h-12 w-12 bg-black text-white my-2 rounded-lg p-2" />

    <NavLink
      activeClassName="text-black"
      className="my-2 rounded-lg p-2 hover:bg-gray-400"
      to="/blogs"
    >
      <List className="h-6 w-6" />
    </NavLink>

    <NavLink
       activeClassName="bg-black text-white"
       className="my-2 rounded-lg p-2 hover:bg-gray-400"
       to="/posts/create"
     >
       <Edit className="h-7 w-7" />
     </NavLink>

     <div className="mb-6 mt-4 flex h-full flex-col justify-end">
      <Avatar size="large" />
    </div>
  </div>
);

export default Sidebar;
