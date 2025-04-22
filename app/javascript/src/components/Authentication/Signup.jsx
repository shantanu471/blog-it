import React, { useState, useEffect } from "react";

import Logger from "js-logger";
import authApi from "apis/auth";
import organizationsApi from "apis/organizations";
import SignupForm from "components/Authentication/Form/Signup";

const Signup = () => {
  const [loading, setLoading] = useState(false);
  const [organizations, setOrganizations] = useState();

  const handleSubmit = async values => {
    setLoading(true);
    try {
      await authApi.signup({
        username: values.username,
        email: values.email,
        password: values.password,
        password_confirmation: values.password_confirmation,
        organization_id: values.organization_id.value,
      });
      setLoading(false);
      window.location.href = "/blogs";
    } catch (error) {
      Logger.error(error);
      setLoading(false);
    }
  };

  const fetchOrganizations = async () => {
    try {
      const {
        data: { organizations },
      } = await organizationsApi.fetch();

      setOrganizations(organizations);
      setLoading(false);
    } catch (error) {
      Logger.error(error);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchOrganizations();
  }, []);

  return (
    <SignupForm
      handleSubmit={handleSubmit}
      loading={loading}
      organizations={organizations}
      initialValues={{
        username: "",
        email: "",
        organization_id: null,
        password: "",
        password_confirmation: "",
      }}
    />
  );
};

export default Signup;
