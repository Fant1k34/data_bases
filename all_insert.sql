INSERT INTO device VALUES (DEFAULT, 'стройный');
INSERT INTO device VALUES (DEFAULT, 'в форме');

INSERT INTO part_of_device VALUES (DEFAULT, 2);
INSERT INTO part_of_device VALUES (DEFAULT, 3);
INSERT INTO part_of_device VALUES (DEFAULT, 2);

INSERT INTO grass VALUES (DEFAULT);
INSERT INTO grass VALUES (DEFAULT);
INSERT INTO grass VALUES (DEFAULT);
INSERT INTO grass VALUES (DEFAULT);
INSERT INTO grass VALUES (DEFAULT);

INSERT INTO take_on_view VALUES (DEFAULT, 1, 2);
INSERT INTO take_on_view VALUES (DEFAULT, 3, NULL);
INSERT INTO take_on_view VALUES (DEFAULT, 2, 4);
INSERT INTO take_on_view VALUES (DEFAULT, NULL, 3);

INSERT INTO pin VALUES (DEFAULT, 'нормальное', 'утолщение', 0.3, 2);
INSERT INTO pin VALUES (DEFAULT, 'утолщение', 'нормальное', 0.7, 1);




INSERT INTO pear VALUES (DEFAULT);
INSERT INTO pear VALUES (DEFAULT);
INSERT INTO pear VALUES (DEFAULT);
INSERT INTO pear VALUES (DEFAULT);
INSERT INTO pear VALUES (DEFAULT);


INSERT INTO remind VALUES (DEFAULT, 1, 1, 'по форме');
INSERT INTO remind VALUES (DEFAULT, 2, 1, 'по форме');


INSERT INTO heat VALUES (DEFAULT, 'нежное, ласкающее', 1);
INSERT INTO heat VALUES (DEFAULT, 'ещё одно', 1);
INSERT INTO heat VALUES (DEFAULT, 'третье', 1);


INSERT INTO bivouac VALUES (DEFAULT, 'маленький');
INSERT INTO bivouac VALUES (DEFAULT, 'большой');
INSERT INTO bivouac VALUES (DEFAULT, 'большой');



INSERT INTO head VALUES(DEFAULT, 2.5);
INSERT INTO head VALUES(DEFAULT, 2.3);
INSERT INTO head VALUES(DEFAULT, -5);


INSERT INTO olvin VALUES (DEFAULT, 1);

INSERT INTO hilvar VALUES (DEFAULT, 2);


INSERT INTO ordering VALUES (DEFAULT, 1, 1, 1, 'мысленная');
INSERT INTO ordering VALUES (DEFAULT, 1, 1, 1, 'реальная');
INSERT INTO ordering VALUES (DEFAULT, 2, 1, 1, 'реальная');


INSERT INTO belonging_to_bivouac VALUES (1, 1, 1);
INSERT INTO belonging_to_bivouac VALUES (2, NULL, 1);
INSERT INTO belonging_to_bivouac VALUES (2, NULL, NULL);

INSERT INTO influence VALUES (DEFAULT, 1, 1, 1, NULL, NULL);

INSERT INTO extension VALUES (DEFAULT, 2, 1, 1, 'возвышаясь над головами');
