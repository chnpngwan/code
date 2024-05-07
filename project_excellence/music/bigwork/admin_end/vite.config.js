import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [vue()],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  server:{
    proxy:{
      "/videoapi":{
        target: "http://localhost:13795", //这里是后台ws访问地址
        changeOrigin: true, //允许跨域设置
        ws: true,
        // rewrite: (path)=> path.replace("/api",""), //拦截路径去除
        withCredentials:true
      },
    },
  }
  
})
