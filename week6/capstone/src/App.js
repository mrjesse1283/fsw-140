import React from 'react'
import axios from 'axios'

function App() {

  function getAllData(){
    axios
    .get('/data')
    .then(res => {
      mapItToLi(res.data)
      console.log(res.data)
    })
  }

  function mapItToLi(arr){
    arr.map(item => {
      let x = document.getElementById("App")
      let y = document.createElement('h3')
      y.innerHTML = `Avenger: ${item.name}`
      
      x.append(y)
    })
  }
  return (
    <div id="App">
      <h2>Apply pressue here to unhide avengers.</h2>
      <button onClick={getAllData}>Show me the peeps</button>
    </div>
  );
}
export default App;