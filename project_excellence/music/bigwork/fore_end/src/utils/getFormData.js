export default function(map){
    let fd = new FormData();
    for(let key in map){
        fd.append(key,map[key])
    }
    return fd;
}