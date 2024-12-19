        const { Engine, Render, Runner, Bodies, Composite, Events, Body } = Matter;

        const engine = Engine.create();
        const world = engine.world;

        engine.world.gravity.y = 3;
        engine.world.gravity.x = 0;

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
        const colors = [
            '#FF6F61', '#6B5B95', '#88B04B', '#F7CAC9',
            '#92A8D1', '#034F84', '#F5D76E', '#D65076'
        ];

        function createCapsule(x, y, text, color, isAdmin = false) {
            if (isAdmin) {
                const emojiTexture = "data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 100'%3E%3Ctext x='50%' y='50%' dominant-baseline='middle' text-anchor='middle' font-size='50'%3E😀%3C/text%3E%3C/svg%3E";
                const adminCapsule = Bodies.rectangle(x, y, 100, 40, {
                    render: {
                        sprite: {
                            texture: emojiTexture,
                            xScale: 0.5,
                            yScale: 0.5
                        }
                    },
                    isStatic: false,
                    restitution: 0.7,
                    friction: 0.1,
                    frictionAir: 0.02
                });
                adminCapsule.isAdmin = true;
                adminCapsule.label = "";
                return adminCapsule;
            } else {
                const capsuleWidth = 120;
                const capsuleHeight = 60;
                const leftCircle = Bodies.circle(x - capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
                const rightCircle = Bodies.circle(x + capsuleWidth / 2, y, capsuleHeight / 2, { render: { fillStyle: color } });
                const rectangle = Bodies.rectangle(x, y, capsuleWidth, capsuleHeight, { render: { fillStyle: color } });
                const capsule = Body.create({
                    parts: [leftCircle, rectangle, rightCircle],
                    restitution: 0.7, // 탄성 설정
                    friction: 0.1,    // 마찰 설정
                    frictionAir: 0.02, // 공기 저항 추가
                    label: text
                });
                return capsule;
            }
        }
        const ground = Bodies.rectangle(350, 410, 700, 20, {
            isStatic: true,
            render: { fillStyle: '#666666' }
        });
        Composite.add(world, ground);
        const capsuleData = [
            { x: 200, y: 0, text: '#  영  주', color: colors[0] },
            { x: 300, y: 0, text: '#  단  양', color: colors[1] },
            { x: 400, y: 0, text: '#  영  월', color: colors[2] },
            { x: 500, y: 0, text: '#  김  제', color: colors[3] },
            { x: 600, y: 0, text: '#  정  읍', color: colors[4] },
            { x: 250, y: 0, text: '#  부  안', color: colors[5] },
            { x: 350, y: 0, text: '#  나  주', color: colors[6] },
            { x: 450, y: 0, text: '#  화  순', color: colors[7] },
            { x: 375, y: 0, text: 'admin', color: '#A8E6CF', isAdmin: true }, // admin 캡슐
            { x: 150, y: 0, text: '#  서  울', color: colors[0] },
            { x: 275, y: 0, text: '#  부  산', color: colors[1] },
            { x: 325, y: 0, text: '#  경  기', color: colors[2] },
            { x: 425, y: 0, text: '#  강  원', color: colors[3] },
            { x: 525, y: 0, text: '#  대  구', color: colors[4] },
            { x: 175, y: 0, text: '#  제  주', color: colors[5] },
            { x: 275, y: 0, text: '#  대  전', color: colors[6] },
            { x: 475, y: 0, text: '#  울  산', color: colors[7] },
            { x: 575, y: 0, text: '#  광  주', color: colors[0] }
        ];
        const capsules = [];
        let currentIndex = 0;
        const adminLink = document.createElement('a');
        adminLink.href = "admin";
        adminLink.style.textDecoration = "none";
        document.body.appendChild(adminLink);
        const maxCapsules = capsuleData.length;
        const intervalId = setInterval(() => {
          /*  if (capsules.length >= maxCapsules) {
                clearInterval(intervalId);
                console.log("캡슐 생성 중지: 최대 개수 도달");
                return;}*/
            const data = capsuleData[currentIndex];
            const capsule = createCapsule(data.x, data.y, data.text, data.color, data.isAdmin);
            Composite.add(world, capsule);
            capsules.push(capsule);
            currentIndex = (currentIndex + 1) % capsuleData.length; // 순환 생성
        }, 700);
        const runner = Runner.create();
        Render.run(render);
        Runner.run(runner, engine);
        render.canvas.addEventListener('click', (event) => {
            const mouseX = event.offsetX;
            const mouseY = event.offsetY;
            capsules.forEach(capsule => {
                if (capsule.isAdmin) {
                    const bounds = capsule.bounds;
                    if (
                        mouseX >= bounds.min.x && mouseX <= bounds.max.x &&
                        mouseY >= bounds.min.y && mouseY <= bounds.max.y
                    ) {
                        window.location.href = "admin";
                    }
                }
            });
        });
        Events.on(render, 'afterRender', function () {
            const context = render.context;
            context.font = "bold 25px NanumHuman";
            context.fillStyle = "#ffffff";
            context.textAlign = "center";

            capsules.forEach(capsule => {
                const angle = capsule.angle;

                context.save();
                context.translate(capsule.position.x, capsule.position.y);
                context.rotate(angle); // 캡슐 각도만큼 회전

                // 텍스트 표시 (admin 제외)
                if (capsule.label !== 'admin' || !capsule.isAdmin) {
                    context.fillText(capsule.label, 0, 10);
                }
                context.restore();
            });
        });
