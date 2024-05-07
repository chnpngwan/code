import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
// import styleImport from 'vite-plugin-style-import';

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    vue(),
    // styleImport({
    //   libs: [
    //     {
    //       libraryName: 'element-plus',
    //       resolveStyle: (name) => {
    //         return `element-plus/lib/theme-chalk/${name}.css`;
    //       },
    //     },
    //   ],
    // }),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    }
  },
  server:{
    host: '0.0.0.0',
    port: 50000,
    // 是否开启 https
    https: false,
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
