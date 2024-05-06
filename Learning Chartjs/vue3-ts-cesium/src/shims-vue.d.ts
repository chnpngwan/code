/* eslint-disable */
declare module '*.vue' {
  import type { DefineComponent } from 'vue'
  const component: DefineComponent<{}, {}, any>
  export default component
  declare var $: any
  declare const Cesium: any
  declare global {
    interface Window { Gviewer: any; }
  }
}
declare var $: any
declare const Cesium: any
declare global {
  interface Window { Gviewer: any; }
}