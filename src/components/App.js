import React, { useState, useEffect } from "react"

const App = (props) => {
  const [gifs, setGifs] = useState([])

  const fetchGifs = async () => {
    try {
      const response = await fetch("/api/v1/gifs")
      if (!response.ok) {
        throw new Error(`${response.status} ${response.statusText}`)
      }
      const responseBody = await response.json()
      // debugger
      setGifs(responseBody)
    } catch (err) {
      console.log(err)
    }
  }

  useEffect(() => {
    fetchGifs()
  }, [])

  const gifImages = gifs.map((gifLink) => {
    return <img src={gifLink} height="200" width="200"></img>
  })

  return (
    <div>
      <h1>Fabulous Images</h1>
      {gifImages}
    </div>
  )
}

export default App
