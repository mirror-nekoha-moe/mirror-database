CREATE TABLE public.beatmap_metadata (
    id bigint NOT NULL,
    creator character varying(100) NOT NULL,
    mode smallint NOT NULL,
    beatmapset_id bigint NOT NULL,
    status smallint,
    cs real,
    ar real,
    od real,
    hp real,
    count_circles bigint,
    count_sliders bigint,
    count_spinners bigint,
    bpm real,
    total_length bigint,
    version character varying(100) NOT NULL
);

CREATE TABLE public.beatmapset_metadata (
    id bigint NOT NULL,
    status smallint NOT NULL,
    title text NOT NULL,
    artist text NOT NULL,
    creator character varying(30) NOT NULL,
    beatmap_count smallint NOT NULL,
    submitted timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    ranked timestamp with time zone NOT NULL,
    loved timestamp with time zone NOT NULL,
    approved timestamp with time zone NOT NULL,
    osu smallint NOT NULL,
    taiko smallint NOT NULL,
    fruits smallint NOT NULL,
    mania smallint NOT NULL,
    missing_audio boolean NOT NULL,
    deleted boolean NOT NULL,
    source text,
    tags text,
    last_lookup timestamp with time zone NOT NULL,
    genre_id smallint,
    language_id smallint,
    title_unicode text NOT NULL,
    artist_unicode text NOT NULL
);

CREATE TABLE public.global_stats (
    last_beatmapset_id bigint DEFAULT 0 NOT NULL,
    beatmapset_count bigint DEFAULT 0 NOT NULL,
    beatmap_count bigint DEFAULT 0 NOT NULL,
    ranked_count bigint DEFAULT 0 NOT NULL,
    approved_count bigint DEFAULT 0 NOT NULL,
    loved_count bigint DEFAULT 0 NOT NULL,
    graveyard_count bigint DEFAULT 0 NOT NULL
);

ALTER TABLE public.beatmapset_metadata OWNER TO root;
ALTER TABLE public.beatmap_metadata OWNER TO root;
ALTER TABLE public.global_stats OWNER TO root;

ALTER TABLE ONLY public.beatmap_metadata
    ADD CONSTRAINT beatmap_metadata_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.beatmapset_metadata
    ADD CONSTRAINT beatmapset_metadata_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.beatmap_metadata
    ADD CONSTRAINT fk_beatmapset_id FOREIGN KEY (beatmapset_id) REFERENCES public.beatmapset_metadata(id) ON DELETE CASCADE;
