Qt.include("three.js")

var camera, scene, renderer;
var geometry, material, mesh,axes;

function initializeGL(canvas) {

    camera = new THREE.PerspectiveCamera( 75, 1, 10, 10000 );
    camera.position.set(1000, 1000, 1000)
//    camera.position.x = 1000;
    camera.lookAt(new THREE.Vector3(0,0,0));


    scene = new THREE.Scene();

    geometry = new THREE.PlaneGeometry(1000,1000,5,5);
 //   geometry = new THREE.BoxGeometry( 1000, 1, 1000 ,10,10,10);
    material = new THREE.MeshBasicMaterial( { color: 0xff0000, wireframe: true } );
    mesh = new THREE.Mesh( geometry, material );
    mesh.position.z = 20;
    scene.add( mesh );

    //在场景中添加坐标轴
    axes = new THREE.AxisHelper(1000);
    scene.add(axes);

    var scene_axes = new THREE.AxisHelper(1000);
    scene.add(scene_axes);

    //创建一个平面
   var planeGeometry = new THREE.PlaneGeometry(5000, 5000 , 10,10);
   //平面使用颜色为0xcccccc的基本材质
   var planeMaterial = new THREE.MeshBasicMaterial({color: 0xcccccc, wireframe: true});//
   var plane = new THREE.Mesh(planeGeometry, planeMaterial);

    //设置屏幕的位置和旋转角度
    plane.rotation.x = -0.5 * Math.PI;
    plane.position.x = 0;
    plane.position.y = 0;
    plane.position.z = 0;

    //将平面添加场景中
    scene.add(plane);


    renderer = new THREE.Canvas3DRenderer( {canvas: canvas, devicePixelRatio: canvas.devicePixelRatio});
    renderer.setSize( canvas.width, canvas.height );
}

function paintGL(canvas) {

//    mesh.rotation.x =Math.PI/2/90 * canvas.xRot;
//    mesh.rotation.y += 0;
//    mesh.rotation.z += Math.PI/2/90 *1;
    axes.rotation.x = mesh.rotation.x =Math.PI/2/90 * canvas.xRot-0.5 * Math.PI;
     //Math.PI/2/90 * (canvas.xRot - 90);
    mesh.rotation.y = axes.rotation.y = Math.PI/2/90 * canvas.yRot;
    mesh.rotation.z = axes.rotation.z = Math.PI/2/90 * canvas.zRot;

    renderer.render( scene, camera );

}

function resizeGL(canvas) {

    if (camera === undefined) return;

    camera.aspect = canvas.width / canvas.height;
    camera.updateProjectionMatrix();

    renderer.setSize( canvas.width, canvas.height );

}
