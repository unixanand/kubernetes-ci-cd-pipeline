import streamlit as st
st.set_page_config(page_title="My K3s Demo", layout="wide")
st.title("Streamlit on K3s POD")
st.success("Version 3.0 - Deployed in Kubenetes POD")
st.sidebar.selectbox("Menu", ["Home", "Dashboard", "About"])
st.balloons()
st.sidebar.markdown("---")
st.sidebar.info("Deployed by Jenkins Pipeline [CI/CD]")
