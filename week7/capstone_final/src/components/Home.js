import React from 'react'

function Home(props) {
    return (
        <div className="home">
            {/* <h2 className="homeHeading">The <br></br> Avengers</h2> */}
            <img className="homeImage" src="data:image/jpeg;base64,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"></img>
            <form className="form">
                <input
                className="input"
                name="name"
                placeholder="name"
                value={props.name}
                onChange={props.handleChange}
                >
                </input>
                <input
                className="input"
                name="URL"
                placeholder="URL"
                value={props.URL}
                onChange={props.handleChange}
                >
                </input>
                <button className="btn" onClick={props.addOne}>Submit</button>
            </form>
        </div>
    )
}

export default Home