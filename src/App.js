import React from 'react';
import './App.css';



export default () => {
  return (
    <div style={styles.container}>
      <h1>hi {process.env.NODE_ENV} ==> {process.env.REACT_APP_NAME}</h1>
      <h2>API_URL: {process.env.REACT_APP_API_URL}</h2>

    </div>
  );
}

const styles = {
  container: {
    flex: 1,
    width: 300,
    height: 300,
    flexDirection: "column" ,
    justifyContent: "center",
    alignItems: "center"
  }
}


