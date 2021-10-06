CREATE TABLE IF NOT EXISTS grass(id serial UNIQUE NOT NULL);


CREATE TYPE enum3 as enum('нормальное', 'утолщение', 'узкость');
CREATE TABLE IF NOT EXISTS pin(id serial UNIQUE NOT NULL,
		 start_form enum3 NOT NULL,
		 end_form enum3 NOT NULL,
		 lenght decimal CHECK (lenght > 0.01) NOT NULL,
		 device_id integer NOT NULL UNIQUE);

CREATE TYPE enum1 as enum('стройный', 'в форме');
CREATE TABLE IF NOT EXISTS device(id serial UNIQUE NOT NULL,
		    size enum1 NOT NULL);



CREATE TABLE IF NOT EXISTS part_of_device(id serial UNIQUE NOT NULL,
			    device_id integer NOT NULL,
			    FOREIGN KEY (device_id) REFERENCES device (id) ON DELETE CASCADE);

CREATE TYPE enum2 as enum('адекватный', 'странный');
CREATE TABLE IF NOT EXISTS take_on_view(id serial UNIQUE NOT NULL,
			  part_of_device_id integer,
			  grass_id integer,
			  adequacy enum2,
			  FOREIGN KEY (part_of_device_id) REFERENCES part_of_device (id) ON DELETE SET NULL,
			  FOREIGN KEY (grass_id) REFERENCES grass (id) ON DELETE SET NULL);


CREATE TABLE IF NOT EXISTS pear(id serial UNIQUE NOT NULL);
CREATE TABLE IF NOT EXISTS remind(id serial UNIQUE NOT NULL,
		    pin_id integer NOT NULL,
		    pear_id integer NOT NULL,
		    type varchar(64) NOT NULL,
		    FOREIGN KEY (pin_id) REFERENCES pin (id) ON DELETE CASCADE,
		    FOREIGN KEY (pear_id) REFERENCES pear (id) ON DELETE CASCADE);
            
CREATE TABLE IF NOT EXISTS head(id serial UNIQUE NOT NULL,
		  size_head integer CHECK (size_head > 0.01) NOT NULL);

CREATE TABLE IF NOT EXISTS olvin(id serial UNIQUE NOT NULL,
		   head_id integer NOT NULL UNIQUE,
		   FOREIGN KEY (head_id) REFERENCES head (id) ON DELETE CASCADE); -- !!!
CREATE TABLE IF NOT EXISTS hilvar(id serial UNIQUE NOT NULL,
		   head_id integer NOT NULL UNIQUE,
		   FOREIGN KEY (head_id) REFERENCES head (id) ON DELETE CASCADE); -- !!!





ALTER TABLE pin
add constraint fk1 FOREIGN KEY (device_id) REFERENCES device (id) ON DELETE CASCADE;


CREATE TYPE enum4 as enum('мысленная', 'реальная');
CREATE TABLE IF NOT EXISTS ordering(id serial UNIQUE NOT NULL,
								 olvin_id integer NOT NULL,
								 hilvar_id integer NOT NULL,
								 pin_id integer NOT NULL,
								 reality enum4 NOT NULL,
								 FOREIGN KEY (olvin_id) REFERENCES olvin (id) ON DELETE CASCADE,
								 FOREIGN KEY (hilvar_id) REFERENCES hilvar (id) ON DELETE CASCADE,
								 FOREIGN KEY (pin_id) REFERENCES pin (id) ON DELETE CASCADE);

CREATE TYPE enum5 as enum('маленький', 'средний', 'большой');
CREATE TABLE IF NOT EXISTS bivouac(id serial UNIQUE NOT NULL,
								   size_type enum5 NOT NULL);

CREATE TABLE IF NOT EXISTS heat(id serial UNIQUE NOT NULL,
								description varchar(256) NOT NULL,
								pin_id integer NOT NULL,
								FOREIGN KEY (pin_id) REFERENCES pin (id) ON DELETE CASCADE);


CREATE TABLE IF NOT EXISTS influence(id serial UNIQUE NOT NULL,
									 bivouac_id integer,
									 heat_id integer NOT NULL UNIQUE,
									 olvin_id integer,
									 way_bivouac varchar(256),
									 way_olvin varchar(256),
									 FOREIGN KEY (bivouac_id) REFERENCES bivouac (id) ON DELETE SET NULL,
									 FOREIGN KEY (heat_id) REFERENCES heat (id) ON DELETE CASCADE,
									 FOREIGN KEY (olvin_id) REFERENCES olvin (id) ON DELETE SET NULL);

CREATE TYPE enum7 as enum('возвышаясь над головами', 'находясь под головами');
CREATE TABLE IF NOT EXISTS extension(id serial UNIQUE NOT NULL,
									 head_id integer NOT NULL,
									 hilvar_id integer NOT NULL,
									 pin_id integer NOT NULL,
									 height enum7,
									 FOREIGN KEY (head_id) REFERENCES head (id) ON DELETE CASCADE,
									 FOREIGN KEY (hilvar_id) REFERENCES hilvar (id) ON DELETE CASCADE,
									 FOREIGN KEY (pin_id) REFERENCES pin (id) ON DELETE CASCADE);

ALTER TABLE pin ADD CONSTRAINT pin_device_id_unique UNIQUE (device_id);


CREATE TABLE IF NOT EXISTS belonging_to_bivouac(bivouac_id serial UNIQUE NOT NULL,
												hilvar_id integer,
												olvin_id integer,
												FOREIGN KEY (bivouac_id) REFERENCES bivouac (id) ON DELETE CASCADE,
												FOREIGN KEY (hilvar_id) REFERENCES hilvar (id) ON DELETE SET NULL,
												FOREIGN KEY (olvin_id) REFERENCES olvin (id) ON DELETE SET NULL);