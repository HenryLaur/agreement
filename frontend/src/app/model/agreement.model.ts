import { ISector } from './sector.model';

export interface IAgreement {
    id?: number;
    name?: string | null;
    isAgreed?: boolean | null;
    sectors?: ISector[] | null;
}
