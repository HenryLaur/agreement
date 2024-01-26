import { IAgreement } from './agreement.model';

export interface ISector {
    id?: number;
    code?: string | null;
    name?: string | null;
    children?: ISector[] | null;
    parent?: ISector | null;
    agreements?: IAgreement[] | null;
}
