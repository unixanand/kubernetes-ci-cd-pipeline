import streamlit as st
st.set_page_config(page_title="My K8s Demo", layout="wide")
st.title("Streamlit on K8s POD")
st.success("Version 2.0 - Deployed in Kubenetes POD")
st.sidebar.selectbox("Menu", ["Home", "Dashboard", "About"])
st.balloons()
st.sidebar.markdown("---")
st.sidebar.info("Deployed by Jenkins Pipeline")
