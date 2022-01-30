import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import { viteCommonjs, esbuildCommonjs } from '@originjs/vite-plugin-commonjs'
import { ViteEjsPlugin } from 'vite-plugin-ejs'
import path from 'path'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    viteCommonjs(),
    react(),
    ViteEjsPlugin((config) => {
      return {
        isDev: config.mode === 'development'
      };
    }),
  ],
  resolve: {
    alias: {
      '@purs': path.resolve(__dirname, './output'),
      '@components': path.resolve(__dirname, './src/components'),
    },
  },
  build: {
    minify: 'terser', // <-- add
    terserOptions: {
      compress: {
        drop_console: true,
        drop_debugger: true,
      },
    },
    commonjsOptions: {
      include: /output|node_modules/,
    }
  },
  server: {
    port: 8080
  },
})
