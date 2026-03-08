# Bad News Bot - Embodied CA Prototype

A 3D photorealistic avatar chatbot for research on delivering unfavorable messages.

![Preview](https://i.imgur.com/placeholder.png)

## Features

- 🎭 **Photorealistic 3D Avatar** - Catherine, powered by TalkingHead + Ready Player Me
- 👄 **Real-time Lip-Sync** - Avatar mouth syncs with speech
- 🔊 **Voice Synthesis** - Browser's built-in Text-to-Speech
- 📊 **A/B Testing** - Toggle between Positive and Negative conditions
- 📱 **Responsive** - Works on desktop and mobile

## Quick Deploy to Vercel (FREE)

### Option 1: One-Click Deploy

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/YOUR_USERNAME/bad-news-bot-prototype)

### Option 2: Manual Deploy

1. **Install Vercel CLI**
   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**
   ```bash
   vercel login
   ```

3. **Deploy**
   ```bash
   cd bad-news-bot-vercel
   vercel
   ```

4. **Done!** Your site will be live at `https://your-project.vercel.app`

## Why Vercel Instead of GitHub Pages?

GitHub Pages has limitations with ES Modules and certain CORS policies that prevent TalkingHead from loading properly. Vercel:

- ✅ Full ES Module support
- ✅ Proper CORS headers
- ✅ Free for personal projects
- ✅ Automatic HTTPS
- ✅ Global CDN

## Alternative: Netlify

You can also deploy to Netlify:

1. Go to [netlify.com](https://netlify.com)
2. Drag and drop this folder
3. Done!

## Project Structure

```
bad-news-bot-vercel/
├── index.html      # Main application
├── package.json    # Project config
└── README.md       # This file
```

## Customization

### Change Avatar

Edit the `AVATAR_URL` in `index.html`:

```javascript
const AVATAR_URL = 'https://models.readyplayer.me/YOUR_AVATAR_ID.glb?morphTargets=ARKit,Oculus+Visemes...';
```

Create your own avatar at [readyplayer.me](https://readyplayer.me) or [playerzero.readyplayer.me](https://playerzero.readyplayer.me)

### Change Script

Edit the `SCRIPT` object in `index.html` to customize:
- Welcome messages
- Task instructions
- Feedback text
- Evaluation messages (positive/negative)

### Add More Tasks

Add more items to the `tasks` array:

```javascript
tasks: [
  { image: "URL", instruction: "Your instruction" },
  // Add more...
]
```

## Tech Stack

- [TalkingHead](https://github.com/met4citizen/TalkingHead) - 3D Avatar with lip-sync
- [Three.js](https://threejs.org/) - 3D rendering
- [Ready Player Me](https://readyplayer.me/) - Avatar creation
- [Web Speech API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Speech_API) - Voice synthesis

## Research Context

This prototype was developed for a research study at Saarland University investigating how digital agents affect emotional responses when delivering unfavorable messages.

**Research Question**: How does the delivery of unfavorable messages by digital agents affect the emotional responses, perceptions, and behaviors of human recipients?

## License

MIT - Free for research and educational use.

## Credits

- Avatar: Ready Player Me
- TalkingHead: [met4citizen](https://github.com/met4citizen/TalkingHead)
- Research: Loan Ta Hong, Saarland University
