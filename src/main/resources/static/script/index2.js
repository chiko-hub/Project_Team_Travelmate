
        // const { Engine, Render, Runner, Bodies, Composite, Body, Events } = Matter;
        //
        // // 1. Matter.js 엔진 및 월드 생성
        // const engine = Engine.create();
        // const world = engine.world;
        //
        // // 2. 렌더링 설정
        // const render = Render.create({
        //     element: document.getElementById('image-container'),
        //     engine: engine,
        //     options: {
        //         width: 700,
        //         height: 430,
        //         wireframes: false,
        //         background: '#2D2D36'
        //     }
        // });
        //
        // // 3. 캡슐 생성 함수
        // function createCapsule(x, y, text, color) {
        //     const capsuleWidth = 150;
        //     const capsuleHeight = 70;
        //
        //     const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
        //     const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
        //     const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });
        //
        //     const capsule = Body.create({
        //         parts: [leftCircle, rectangle, rightCircle],
        //         restitution: 0.7,
        //         friction: 0.1,
        //         inertia: Infinity,
        //         label: text
        //     });
        //
        //     return capsule;
        // }
        //
        // // 4. 바닥 생성
        // const ground = Bodies.rectangle(350, 410, 700, 20, {
        //     isStatic: true,
        //     render: { fillStyle: '#666666' }
        // });
        // Composite.add(world, ground);
        //
        // // 5. 캡슐 데이터
        // const capsuleData = [
        //     { x: 200, y: 0, text: '#  영  주', color: '#FFD700' },
        //     { x: 300, y: 0, text: '#  단  양', color: '#4682B4' },
        //     { x: 400, y: 0, text: '#  영  월', color: '#32CD32' },
        //     { x: 500, y: 0, text: '#  김  제', color: '#FFD700' },
        //     { x: 600, y: 0, text: '#  정  읍', color: '#DA70D6' },
        //     { x: 250, y: 0, text: '#  부  안', color: '#FF8C00' },
        //     { x: 350, y: 0, text: '#  나  주', color: '#1E90FF' },
        //     { x: 450, y: 0, text: '#  화  순', color: '#8A2BE2' },
        //     { x: 550, y: 0, text: '#  보  성', color: '#00FA9A' },
        //     { x: 650, y: 0, text: '#  영  암', color: '#FF4500' },
        //     { x: 375, y: 0, text: 'admin', color: '#FF1493' } // admin 캡슐 추가
        // ];
        //
        // const capsules = [];
        // let currentIndex = 0;
        //
        // // 6. HTML 요소 생성 (admin 링크)
        // const adminLink = document.createElement('a');
        // adminLink.href = 'admin';
        // adminLink.textContent = 'admin';
        // adminLink.style.position = 'absolute';
        // adminLink.style.textDecoration = 'none';
        // adminLink.style.color = 'white';
        // adminLink.style.fontSize = '16px';
        // adminLink.style.zIndex = '10';
        // document.body.appendChild(adminLink);
        //
        // // 7. 순차적으로 캡슐 생성 (최대 25개 제한)
        // const maxCapsules = 25;
        //
        // const intervalId = setInterval(() => {
        //     if (capsules.length >= maxCapsules) {
        //         clearInterval(intervalId);
        //         console.log("캡슐 생성 중지: 최대 개수 도달");
        //         return;
        //     }
        //
        //     const data = capsuleData[currentIndex];
        //     const capsule = createCapsule(data.x, data.y, data.text, data.color);
        //     Composite.add(world, capsule);
        //     capsules.push(capsule);
        //
        //     currentIndex = (currentIndex + 1) % capsuleData.length;
        // }, 700);
        //
        // // 8. Matter.js 실행
        // const runner = Runner.create();
        // Render.run(render);
        // Runner.run(runner, engine);
        //
        // // 9. 텍스트 렌더링 & admin 링크 위치 동기화
        // Events.on(render, 'afterRender', function() {
        //     const context = render.context;
        //     context.font = "bold 31px Arial";
        //     context.fillStyle = "#ffffff";
        //     context.textAlign = "center";
        //
        //     capsules.forEach(capsule => {
        //         context.fillText(capsule.label, capsule.position.x, capsule.position.y + 10);
        //
        //         // 'admin' 링크의 위치를 해당 캡슐과 동기화
        //         if (capsule.label === 'admin') {
        //             adminLink.style.left = `${capsule.position.x - 20}px`;
        //             adminLink.style.top = `${capsule.position.y - 10}px`;
        //         }
        //     });
        // });
                // const { Engine, Render, Runner, Bodies, Composite, Body, Events } = Matter;
                //
                // // 1. Matter.js 엔진 및 월드 생성
                // const engine = Engine.create();
                // const world = engine.world;
                //
                // // 2. 렌더링 설정
                // const render = Render.create({
                //     element: document.getElementById('image-container'),
                //     engine: engine,
                //     options: {
                //         width: 700,
                //         height: 430,
                //         wireframes: false,
                //         background: '#2D2D36'
                //     }
                // });
                //
                // // 3. 캡슐 생성 함수
                // function createCapsule(x, y, text, color) {
                //     const capsuleWidth = 150;
                //     const capsuleHeight = 70;
                //
                //     const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
                //     const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
                //     const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });
                //
                //     const capsule = Body.create({
                //         parts: [leftCircle, rectangle, rightCircle],
                //         restitution: 0.7,
                //         friction: 0.1,
                //         inertia: Infinity,
                //         label: text
                //     });
                //
                //     return capsule;
                // }
                //
                // // 4. 바닥 생성
                // const ground = Bodies.rectangle(350, 410, 700, 20, {
                //     isStatic: true,
                //     render: { fillStyle: '#666666' }
                // });
                // Composite.add(world, ground);
                //
                // // 5. 캡슐 데이터
                // const capsuleData = [
                //     { x: 200, y: 0, text: '#  영  주', color: '#FFD700' },
                //     { x: 300, y: 0, text: '#  단  양', color: '#4682B4' },
                //     { x: 400, y: 0, text: '영월', color: '#32CD32' },
                //     { x: 500, y: 0, text: '김제', color: '#FFD700' },
                //     { x: 600, y: 0, text: '정읍', color: '#DA70D6' },
                //     { x: 375, y: 0, text: 'admin', color: '#FF1493' } // admin 캡슐
                // ];
                //
                // const capsules = [];
                // let currentIndex = 0;
                //
                // // 6. HTML 요소 생성 (admin 링크)
                // const adminLink = document.createElement('a');
                // adminLink.href = 'admin';
                // adminLink.textContent = 'admin';
                // adminLink.style.position = 'absolute';
                // adminLink.style.textDecoration = 'none';
                // adminLink.style.color = 'white';
                // adminLink.style.fontSize = '16px';
                // adminLink.style.zIndex = '1000'; // 상위에 표시
                // adminLink.style.pointerEvents = 'auto'; // 클릭 가능
                // document.body.appendChild(adminLink);
                //
                // // 7. 순차적으로 캡슐 생성
                // const maxCapsules = 25;
                //
                // const intervalId = setInterval(() => {
                //     if (capsules.length >= maxCapsules) {
                //         clearInterval(intervalId);
                //         console.log("캡슐 생성 중지: 최대 개수 도달");
                //         return;
                //     }
                //
                //     const data = capsuleData[currentIndex];
                //     const capsule = createCapsule(data.x, data.y, data.text, data.color);
                //     Composite.add(world, capsule);
                //     capsules.push(capsule);
                //
                //     currentIndex = (currentIndex + 1) % capsuleData.length;
                // }, 1000);
                //
                // // 8. Matter.js 실행
                // const runner = Runner.create();
                // Render.run(render);
                // Runner.run(runner, engine);
                //
                // // 9. 텍스트 렌더링 & admin 링크 위치 동기화
                // Events.on(render, 'afterRender', function() {
                //     const context = render.context;
                //     context.font = "bold 31px Arial";
                //     context.fillStyle = "#ffffff";
                //     context.textAlign = "center";
                //
                //     capsules.forEach(capsule => {
                //         context.fillText(capsule.label, capsule.position.x, capsule.position.y + 10);
                //
                //         // 'admin' 링크의 위치를 해당 캡슐과 동기화
                //         if (capsule.label === 'admin') {
                //             adminLink.style.left = `${capsule.position.x - 20}px`;
                //             adminLink.style.top = `${capsule.position.y - 10}px`;
                //         }
                //     });
                // });

        // const { Engine, Render, Runner, Bodies, Composite, Events, Body } = Matter;
        //
        // // 1. Matter.js 엔진 및 월드 생성
        // const engine = Engine.create();
        // const world = engine.world;
        //
        // // 2. 렌더링 설정
        // const render = Render.create({
        //     element: document.getElementById('image-container'),
        //     engine: engine,
        //     options: {
        //         width: 700,
        //         height: 430,
        //         wireframes: false,
        //         background: '#2D2D36'
        //     }
        // });
        //
        // // 3. 캡슐 생성 함수
        // function createCapsule(x, y, text, color) {
        //     const capsuleWidth = 150;
        //     const capsuleHeight = 70;
        //
        //     const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
        //     const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
        //     const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });
        //
        //     const capsule = Body.create({
        //         parts: [leftCircle, rectangle, rightCircle],
        //         restitution: 0.7,
        //         friction: 0.1,
        //         inertia: Infinity,
        //         label: text
        //     });
        //
        //     return capsule;
        // }
        //
        // // 4. 바닥 생성
        // const ground = Bodies.rectangle(350, 410, 700, 20, {
        //     isStatic: true,
        //     render: { fillStyle: '#666666' }
        // });
        // Composite.add(world, ground);
        //
        // // 5. 캡슐 데이터
        // const capsuleData = [
        //     { x: 375, y: 0, text: 'admin', color: '#FF1493' } // admin 캡슐 추가
        // ];
        //
        // const capsules = [];
        // let currentIndex = 0;
        //
        // // 6. HTML 링크 요소 가져오기
        // const adminLink = document.getElementById('admin-link');
        //
        // // 7. Matter.js 캡슐 생성
        // const maxCapsules = 1;
        // const data = capsuleData[currentIndex];
        // const capsule = createCapsule(data.x, data.y, data.text, data.color);
        // Composite.add(world, capsule);
        // capsules.push(capsule);
        //
        // // 8. Matter.js 실행
        // const runner = Runner.create();
        // Render.run(render);
        // Runner.run(runner, engine);
        //
        // // 9. 캡슐 위치에 HTML 링크 표시
        // Events.on(render, 'afterRender', function () {
        //     const capsule = capsules[0]; // admin 캡슐
        //
        //     if (capsule) {
        //         adminLink.style.display = 'block';
        //         adminLink.style.left = `${capsule.position.x - 20}px`;
        //         adminLink.style.top = `${capsule.position.y - 10}px`;
        //     }
        // });


        //
        // const { Engine, Render, Runner, Bodies, Composite, Events, Body } = Matter;
        //
        // // 1. Matter.js 엔진 및 월드 생성
        // const engine = Engine.create();
        // const world = engine.world;
        //
        // // 2. 렌더링 설정
        // const render = Render.create({
        //     element: document.getElementById('image-container'),
        //     engine: engine,
        //     options: {
        //         width: 700,
        //         height: 430,
        //         wireframes: false,
        //         background: '#2D2D36'
        //     }
        // });
        //
        // // 3. 캡슐 생성 함수
        // function createCapsule(x, y, text, color) {
        //     const capsuleWidth = 150;
        //     const capsuleHeight = 70;
        //
        //     const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
        //     const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
        //     const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });
        //
        //     const capsule = Body.create({
        //         parts: [leftCircle, rectangle, rightCircle],
        //         restitution: 0.7,
        //         friction: 0.1,
        //         inertia: Infinity,
        //         label: text
        //     });
        //
        //     return capsule;
        // }
        //
        // // 4. 바닥 생성
        // const ground = Bodies.rectangle(350, 410, 700, 20, {
        //     isStatic: true,
        //     render: { fillStyle: '#666666' }
        // });
        // Composite.add(world, ground);
        //
        // // 5. 캡슐 데이터
        // const capsuleData = [
        //     { x: 200, y: 0, text: '영주', color: '#FF6347' },
        //     { x: 300, y: 0, text: '단양', color: '#4682B4' },
        //     { x: 400, y: 0, text: '영월', color: '#32CD32' },
        //     { x: 500, y: 0, text: '김제', color: '#FFD700' },
        //     { x: 600, y: 0, text: '정읍', color: '#DA70D6' },
        //     { x: 250, y: 0, text: '부안', color: '#FF8C00' },
        //     { x: 350, y: 0, text: '나주', color: '#1E90FF' },
        //     { x: 450, y: 0, text: '화순', color: '#8A2BE2' },
        //     { x: 550, y: 0, text: '보성', color: '#00FA9A' },
        //     { x: 650, y: 0, text: '영암', color: '#FF4500' },
        //     { x: 375, y: 0, text: 'admin', color: '#FF1493' } // admin 캡슐 추가
        // ];
        //
        // const capsules = [];
        // let currentIndex = 0;
        //
        // // 6. HTML 링크 요소 가져오기
        // const adminLink = document.getElementById('admin-link');
        //
        // // 7. 캡슐 생성 (순차적으로 캡슐을 생성)
        // const maxCapsules = capsuleData.length;
        //
        // const intervalId = setInterval(() => {
        //     if (capsules.length >= maxCapsules) {
        //         clearInterval(intervalId);
        //         console.log("캡슐 생성 중지: 최대 개수 도달");
        //         return;
        //     }
        //
        //     const data = capsuleData[currentIndex];
        //     const capsule = createCapsule(data.x, data.y, data.text, data.color);
        //     Composite.add(world, capsule);
        //     capsules.push(capsule);
        //
        //     currentIndex = (currentIndex + 1) % capsuleData.length; // 순환 생성
        // }, 1000);
        //
        // // 8. Matter.js 실행
        // const runner = Runner.create();
        // Render.run(render);
        // Runner.run(runner, engine);
        //
        // // 9. 모든 캡슐에 텍스트 렌더링 및 admin 링크 표시
        // Events.on(render, 'afterRender', function () {
        //     const context = render.context;
        //     context.font = "bold 30px Arial";
        //     context.fillStyle = "#ffffff";
        //     context.textAlign = "center";
        //
        //     capsules.forEach(capsule => {
        //         // 모든 캡슐의 텍스트 렌더링
        //         context.fillText(capsule.label, capsule.position.x, capsule.position.y + 10);
        //
        //         // admin 링크 위치 업데이트
        //         if (capsule.label === 'admin') {
        //             adminLink.style.display = 'block';
        //             adminLink.style.left = `${capsule.position.x - 20}px`;
        //             adminLink.style.top = `${capsule.position.y - 10}px`;
        //         }
        //     });
        // });
                    // const { Engine, Render, Runner, Bodies, Composite, Events, Body } = Matter;
                    //
                    // // 1. Matter.js 엔진 및 월드 생성
                    // const engine = Engine.create();
                    // const world = engine.world;
                    //
                    // // 2. 렌더링 설정
                    // const render = Render.create({
                    //     element: document.getElementById('image-container'),
                    //     engine: engine,
                    //     options: {
                    //         width: 700,
                    //         height: 430,
                    //         wireframes: false,
                    //         background: '#2D2D36'
                    //     }
                    // });
                    //
                    // // 3. 캡슐 생성 함수
                    // function createCapsule(x, y, text, color) {
                    //     const capsuleWidth = 150;
                    //     const capsuleHeight = 70;
                    //
                    //     const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
                    //     const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
                    //     const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });
                    //
                    //     const capsule = Body.create({
                    //         parts: [leftCircle, rectangle, rightCircle],
                    //         restitution: 0.7,
                    //         friction: 0.1,
                    //         inertia: Infinity,
                    //         label: text
                    //     });
                    //
                    //     return capsule;
                    // }
                    //
                    // // 4. 바닥 생성
                    // const ground = Bodies.rectangle(350, 410, 700, 20, {
                    //     isStatic: true,
                    //     render: { fillStyle: '#666666' }
                    // });
                    // Composite.add(world, ground);
                    //
                    // // 5. 캡슐 데이터
                    // const capsuleData = [
                    //     { x: 200, y: 0, text: '영  주', color: '#FF6347' },
                    //     { x: 300, y: 0, text: '단  양', color: '#4682B4' },
                    //     { x: 400, y: 0, text: '영  월', color: '#32CD32' },
                    //     { x: 500, y: 0, text: '김  제', color: '#FFD700' },
                    //     { x: 600, y: 0, text: '정  읍', color: '#DA70D6' },
                    //     { x: 250, y: 0, text: '부  안', color: '#FF8C00' },
                    //     { x: 350, y: 0, text: '나  주', color: '#1E90FF' },
                    //     { x: 450, y: 0, text: '화  순', color: '#8A2BE2' },
                    //     { x: 550, y: 0, text: '보  성', color: '#00FA9A' },
                    //     { x: 650, y: 0, text: '영  암', color: '#FF4500' },
                    //     { x: 375, y: 0, text: 'admin', color: '#FF1493', shape: 'polygon' } // admin 캡슐 추가
                    // ];
                    //
                    // const capsules = [];
                    // let currentIndex = 0;
                    //
                    // // 6. HTML 링크 요소 가져오기
                    // const adminLink = document.getElementById('admin-link');
                    //
                    // // 7. 캡슐 생성 (순차적으로 캡슐을 생성)
                    // const maxCapsules = capsuleData.length;
                    //
                    // const intervalId = setInterval(() => {
                    //     if (capsules.length >= maxCapsules) {
                    //         clearInterval(intervalId);
                    //         console.log("캡슐 생성 중지: 최대 개수 도달");
                    //         return;
                    //     }
                    //
                    //     const data = capsuleData[currentIndex];
                    //     const capsule = createCapsule(data.x, data.y, data.text, data.color);
                    //     Composite.add(world, capsule);
                    //     capsules.push(capsule);
                    //
                    //     currentIndex = (currentIndex + 1) % capsuleData.length; // 순환 생성
                    // }, 1000);
                    //
                    // // 8. Matter.js 실행
                    // const runner = Runner.create();
                    // Render.run(render);
                    // Runner.run(runner, engine);
                    //
                    // // 9. 캡슐 위치에 HTML 링크 표시 (admin만 따로 처리)
                    // Events.on(render, 'afterRender', function () {
                    //     const context = render.context;
                    //     context.font = "bold 30px Arial";
                    //     context.fillStyle = "#ffffff";
                    //     context.textAlign = "center";
                    //
                    //     capsules.forEach(capsule => {
                    //         // 'admin' 캡슐은 텍스트를 렌더링하지 않음
                    //         if (capsule.label !== 'admin') {
                    //             context.fillText(capsule.label, capsule.position.x, capsule.position.y + 10);
                    //         }
                    //
                    //         // admin 링크 위치 업데이트
                    //         if (capsule.label === 'admin') {
                    //             adminLink.style.display = 'block';
                    //             adminLink.style.left = `${capsule.position.x - 20}px`;
                    //             adminLink.style.top = `${capsule.position.y - 10}px`;
                    //         }
                    //     });
                    // });

        const { Engine, Render, Runner, Bodies, Composite, Events, Body } = Matter;

        // 1. Matter.js 엔진 및 월드 생성
        const engine = Engine.create();
        const world = engine.world;

        // 2. 렌더링 설정
        const render = Render.create({
            element: document.getElementById('image-container'),
            engine: engine,
            options: {
                width: 700,
                height: 430,
                wireframes: false,
                background: '#2D2D36'
            }
        });

        // 3. 색상 팔레트 (녹색 컬러 팔레트 적용)
        const colors = [
            '#A8E6CF', '#DCEDC1', '#AED581', '#81C784',
            '#4CAF50', '#388E3C', '#2E7D32', '#1B5E20'
        ];

        // 4. 캡슐 생성 함수
        function createCapsule(x, y, text, color, isAdmin = false) {
            const capsuleWidth = isAdmin ? 100 : 150; // admin 캡슐만 작게 설정
            const capsuleHeight = isAdmin ? 40 : 70;

            const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
            const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
            const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });

            const capsule = Body.create({
                parts: [leftCircle, rectangle, rightCircle],
                restitution: 0.7,
                friction: 0.1,
                inertia: Infinity,
                label: text
            });

            return capsule;
        }

        // 5. 바닥 생성
        const ground = Bodies.rectangle(350, 410, 700, 20, {
            isStatic: true,
            render: { fillStyle: '#666666' }
        });
        Composite.add(world, ground);

        // 6. 캡슐 데이터
        const capsuleData = [
            { x: 200, y: 0, text: '#  영  주', color: colors[0] },
            { x: 300, y: 0, text: '#  단  양', color: colors[1] },
            { x: 400, y: 0, text: '#  영  월', color: colors[2] },
            { x: 500, y: 0, text: '#  김  제', color: colors[3] },
            { x: 600, y: 0, text: '#  정  읍', color: colors[4] },
            { x: 250, y: 0, text: '#  부  안', color: colors[5] },
            { x: 350, y: 0, text: '#  나  주', color: colors[6] },
            { x: 450, y: 0, text: '#  화  순', color: colors[7] },
            { x: 375, y: 0, text: 'admin', color: '#A8E6CF', isAdmin: true } // admin 캡슐
        ];

        const capsules = [];
        let currentIndex = 0;

        // 7. HTML 링크 요소 가져오기
        const adminLink = document.getElementById('admin-link');

        // 8. 캡슐 생성 (모든 캡슐 생성)
        const maxCapsules = capsuleData.length;

        const intervalId = setInterval(() => {
            if (capsules.length >= maxCapsules) {
                clearInterval(intervalId);
                console.log("캡슐 생성 중지: 최대 개수 도달");
                return;
            }

            const data = capsuleData[currentIndex];
            const capsule = createCapsule(data.x, data.y, data.text, data.color, data.isAdmin);
            Composite.add(world, capsule);
            capsules.push(capsule);

            currentIndex = (currentIndex + 1) % capsuleData.length; // 순환 생성
        }, 700);

        // 9. Matter.js 실행
        const runner = Runner.create();
        Render.run(render);
        Runner.run(runner, engine);

        // 10. 텍스트 및 admin 링크 표시
        Events.on(render, 'afterRender', function () {
            const context = render.context;
            context.font = "bold 25px Arial";
            context.fillStyle = "#ffffff";
            context.textAlign = "center";

            capsules.forEach(capsule => {
                if (capsule.label !== 'admin') {
                    context.fillText(capsule.label, capsule.position.x, capsule.position.y + 10);
                }

                if (capsule.label === 'admin') {
                    adminLink.style.display = 'block';
                    adminLink.style.left = `${capsule.position.x - 20}px`;
                    adminLink.style.top = `${capsule.position.y - 10}px`;
                }
            });
        });