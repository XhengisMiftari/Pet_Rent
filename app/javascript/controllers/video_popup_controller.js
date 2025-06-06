import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { video: String }

  play() {
    const videoUrl = this.videoValue
    const popup = window.open("", "VideoPopup", "width=800,height=450")
    popup.document.write(`
      <html>
        <head>
          <title>Video</title>
          <style>
            body { margin:0; background:#000; display:flex; align-items:center; justify-content:center; height:100vh; }
          </style>
        </head>
        <body>
          <video src="${videoUrl}" controls autoplay style="max-width:100%; max-height:100vh;"></video>
        </body>
      </html>
    `)
  }
}
