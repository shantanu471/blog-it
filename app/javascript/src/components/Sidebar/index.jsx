import React, { useState } from "react";

import { Book, Edit, List, ListDetails } from "@bigbinary/neeto-icons";
import { Avatar, Button } from "@bigbinary/neetoui";
import { NavLink } from "react-router-dom";

import SidePane from "./SidePane";

const Sidebar = ({ onCategorySearch, onCategorySelect, onSidebarOpen }) => {
  const [isPaneOpen, setIsPaneOpen] = useState(false);

  const handleSidePane = () => {
    setIsPaneOpen(!isPaneOpen);
    onSidebarOpen(!isPaneOpen);
  };

  return (
    <div className="fixed flex h-screen">
      <div className="flex w-16 flex-col items-center border-r border-gray-200 bg-white py-4">
        <NavLink
          activeClassName="bg-black text-white"
          className="my-2 rounded-lg p-2 hover:bg-gray-400"
          to="/blogs"
        >
          <Book className="h-6 w-6" />
        </NavLink>
        <NavLink
          activeClassName="bg-black text-white"
          className="my-2 rounded-lg p-2 hover:bg-gray-400"
          to="/lists"
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
        <Button
          className="my-2 rounded-lg p-2 hover:bg-gray-400"
          icon={() => <ListDetails />}
          label=""
          style="text"
          onClick={handleSidePane}
        />
        <div className="mb-6 mt-4 flex h-full flex-col justify-end">
          <Avatar size="large" />
        </div>
      </div>
      <SidePane
        isOpen={isPaneOpen}
        onCategorySearch={onCategorySearch}
        onCategorySelect={onCategorySelect}
      />
    </div>
  );
};

export default Sidebar;
